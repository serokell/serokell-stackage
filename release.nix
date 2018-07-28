{ pkgs ? import <nixpkgs> {} }:

let
  stackageRev = "b69b9987e989c925c2bc467f409b259fe248106f";
  stackageSha = "0p31hnnn6fdni3mr142bwnl0kdgx39m3jc9py3qvdfy1nbdmvakz";

  stackageNixRev = "bbb01f8c59a4afaa4ddf3c00f94be5d91ada89f8";
  stackageNixSha = "0sh17cgbm03ln24whhqwr4la8ksbb3cwlncm61xfh59yr8qlaa5q";
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
