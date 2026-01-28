{ ... }:

{
  imports = [
    ./zen-browser.nix
    ./docker.nix
  ];

  programs = {
    zsh.enable = true;
  };
}
