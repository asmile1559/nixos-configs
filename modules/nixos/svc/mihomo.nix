{ pkgs, ... }:

{
  networking.firewall = {
    trustedInterfaces = [
      "Mihomo"
    ];
    checkReversePath = false;
  };

  services.mihomo = {
    enable = true;
    tunMode = true;
    configFile = "/etc/mihomo/config.yaml";
  };
}
