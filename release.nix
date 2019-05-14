{ pkgs ? import <nixpkgs> {} }:

let
  stackageRev = "b69b9987e989c925c2bc467f409b259fe248106f";
  stackageSha = "0p31hnnn6fdni3mr142bwnl0kdgx39m3jc9py3qvdfy1nbdmvakz";

  stackageNixRev = "9c62ed37bd950c2270cf1ab16f2a2109fa96fca5";
  stackageNixSha = "17haassm2ixq2b15bwbznvz1mxid6ssnhm9kikavqjpr64h9662g";
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
