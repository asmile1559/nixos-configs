{ pkgs, ... }:

{
  imports = [
    ./steam.nix
    ./niri.nix
  ];
}