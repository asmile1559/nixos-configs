{ pkgs, ... }:

{
  imports = [
    ./zsh.nix
    ./starship.nix
    ./vscode.nix
    ./git.nix
    ./nixvim.nix
  ];
}