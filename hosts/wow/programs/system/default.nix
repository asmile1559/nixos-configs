{ pkgs, ... }:

{
  imports = [
    ./steam.nix
    ./niri.nix
    ./direnv.nix
  ];
}