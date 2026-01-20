{ ... }:

{
  imports = [
    ./zen-browser.nix
  ];

  programs = {
    zsh.enable = true;
  };
}
