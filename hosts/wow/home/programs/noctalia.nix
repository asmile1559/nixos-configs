{ pkgs, ... }:

{
  programs.noctalia-shell = {
    enable = true;
    systemd.enable = true;
  };
}
