{ pkgs ? import <nixpkgs> {} }:

let
  ormoluSrc = builtins.fetchTarball "https://github.com/tweag/ormolu/tarball/0.0.5.0";
  ormolu = (import ormoluSrc {}).ormolu;
  ghcideSrc = builtins.fetchTarball "https://github.com/cachix/ghcide-nix/tarball/master";
  ghcide = (import ghcideSrc {}).ghcide-ghc865;
in

pkgs.mkShell {
  buildInputs = [
    pkgs.haskell.compiler.ghc865
    pkgs.cabal-install
    pkgs.ghcid

    ghcide
    ormolu
  ];
}
