{ pkgs, ... }:

{
  systemd.user.services.create-symlink-of-fonts = {
    Unit = {
      Description = "Create symlink to system fonts";
    };
    Service = {
      ExecStart = [
        "${pkgs.coreutils}/bin/ln -sf /run/current-system/sw/share/X11/fonts %h/.local/share/fonts"
      ];
      Restart = "on-failure";
    };
  };
}
