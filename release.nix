{ pkgs ? import <nixpkgs> {} }:

let
  stackageRev = "b69b9987e989c925c2bc467f409b259fe248106f";
  stackageSha = "0p31hnnn6fdni3mr142bwnl0kdgx39m3jc9py3qvdfy1nbdmvakz";

  stackageNixRev = "71f025af0171aef133584efbf5c532ebc7aab0d1";
  stackageNixSha = "12mvpf5wbwn7h2raa92p83f7s5fbp8vblwz4jswkbsya5kxhfrlf";
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
}
