{ pkgs, inputs, ... }:

{
  imports = [
    inputs.niri.nixosModules.niri
  ];

  nixpkgs.overlays = [ inputs.niri.overlays.niri ];

  environment.systemPackages = [
    pkgs.playerctl
    pkgs.xwayland-satellite
    pkgs.qt6Packages.qt6ct
    pkgs.swayidle

    pkgs.xdg-desktop-portal-hyprland
    pkgs.xdg-desktop-portal-gnome
  ];

  environment.variables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
    QT_QPA_PLATFORMTHEME = "qt6ct";
  };

  services.gnome.evolution-data-server.enable = true;

  hardware.bluetooth.enable = true;
  services = {
    power-profiles-daemon.enable = true;
    upower.enable = true;
  };

  programs.niri = {
    enable = true;
    package = pkgs.niri-unstable;
  };
}
