{ pkgs ? import <nixpkgs> {} }:

let
  stackageRev = "b69b9987e989c925c2bc467f409b259fe248106f";
  stackageSha = "0p31hnnn6fdni3mr142bwnl0kdgx39m3jc9py3qvdfy1nbdmvakz";

  stackageNixRev = "9bed42a3518de50a021bacea4c0747887d27aa67";
  stackageNixSha = "05xax06sn92nprcxzi7x95paj7sqjqczdalkr5pjljcxklvyh2j0";
in

import ./. {
  inherit pkgs;
  stackageSrc = fetchTarball {
    url = "https://github.com/commercialhaskell/lts-haskell/archive/${stackageRev}.tar.gz";
    sha256 = stackageSha;
  };
  stackageNixSrc = fetchTarball {
    url = "https://github.com/serokell/stackage-nix/archive/${stackageNixRev}.tar.gz";
    sha256 = stackageNixSha;
  };
  baseUrl = "https://stackage.serokell.io";
  googleAnalytics = "UA-122497911-1";
}
