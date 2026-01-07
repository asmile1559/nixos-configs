{ config, pkgs, ... }:

{
  systemd.services.clean-old-generations = {
    description = "Clean old nixos generations per 7 days";
    script = "./scripts/clean-old-generations.sh";
    serviceConfig = {
        Type = "oneshot";
        User = "root";
        RemainAfterExit = true;
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