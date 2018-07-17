serokell-stackage
==================

This is the source of the website that hosts [stackage][stackage] snapshots as [nixpkgs][nixpkgs] overlays.

Live version is at <https://stackage.serokell.io/>.


## Stackage generations

The tools that are used to generate snapshots constantly evolve, so, even if stackage snapshots
themselves are immutable, it is possible that the generated nix expressions for them will change.
Therefore, each set of expressions representing snapshots is identified by a unique generation id,
which dependes on the version of the generator and the version of the stackage commit used to
produce the expressions.

`release.nix` in this repository generates just one set of expressions, but it is important
to keep all the previous generations as well, because users will hardcode them in their
nix expressions and update only from time to time. It is assumed that keeping older
generations accessible is handled by the deployment code.


## Website

The structure of the generated website is the following:

* `index.html` – page that explains how to use the snapshots in your Nix expressions
* `<generation-id>/` – output of [`stackage-nix`][stackage-nix]


  [stackage]:     https://www.stackage.org
  [nixpkgs]:      https://nixos.org/nixpkgs/
  [stackage-nix]: https://github.com/serokell/stackage-nix
