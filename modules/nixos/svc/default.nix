{ ... }:

{
  imports = [
    ./mihomo.nix
  ];
  services = {
    flatpak.enable = true;
  };
}
