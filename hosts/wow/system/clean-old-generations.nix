{ config, pkgs, ... }:

{
  systemd.services.clean-old-generaions = {
    description = "Clean old nixos genrations per 7 days";
    script = "/etc/nixos/hosts/system/scripts/clean-old-generaions.sh";
    serviceConfig = {
        Type = "oneshot";
        User = "root";
    };
  };

  systemd.timers.clean-old-generations = {
    description = "Trigger weekly cleanup of Nix generations";
    partOf = [ "clean-old-generations.service" ];
    wantedBy = [ "timers.target" ];
    timerConfig = {
      OnCalendar = "weekly";
      Persistent = true;
    };
  };
}