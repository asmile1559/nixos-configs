{ config, pkgs, ... }:

{
  systemd.user.services.create-symlink-of-fonts = {
    enable = true;
    description = "Create symlink to system fonts";
    serviceConfig = {
        Type = "oneshot";
        ExecStart = "${pkgs.coreutils}/bin/ln -sf /run/current-system/sw/share/X11/fonts %h/.local/share/fonts";
        RemainAfterExit = true;
    };
    wantedBy = [ "default.target" ];
  };
}