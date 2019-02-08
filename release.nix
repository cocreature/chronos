{ nixpkgs ? import ./nixpkgs.nix }:

with nixpkgs.haskell.lib;
with nixpkgs.lib;
let tested = [ "ghc844"
               "ghc863"
               "ghcHEAD"
               ];
    eval = x: import ./default.nix { nixpkgs = nixpkgs; compiler = x; };
in
{ sdist = sdistTarball (eval (last tested));
} // genAttrs tested eval
