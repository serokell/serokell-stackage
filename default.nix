{ pkgs

, stackageNixSrc
, stackageSrc
, baseUrl
, googleAnalytics ? ""
}:

let
  stackageNix = import stackageNixSrc {
    inherit pkgs stackageSrc baseUrl;
  };

in pkgs.stdenvNoCC.mkDerivation {
  name = "serokell-stackage";

  buildCommand = ''
    function patchVar {
      sed -i 's@\$'"$1"'\$@'"$2"'@g' "$out/index.html"
    }

    mkdir -p "$out"

    cp -R "${./web}"/* "$out"
    patchVar "baseUrl" "${baseUrl}"
    patchVar "generationId" $(basename "${stackageNix}")
    patchVar "tarballSha256" $(cat "${stackageNix}/default.nix.tar.gz.sha256")

    patchVar "googleAnalytics" "${googleAnalytics}"

    ln -s "${stackageNix}" "$out/"
  '';
}
