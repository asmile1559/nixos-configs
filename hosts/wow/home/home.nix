{ pkgs, inputs, ... }:

{

  imports = [
    inputs.nixvim.homeModules.nixvim
    inputs.noctalia.homeModules.default
    ./programs
    ./configs/dconf
    ./services
  ];

  home = {
    username = "dub";
    homeDirectory = "/home/dub";
    shell = {
      enableZshIntegration = true;
    };
  };

  fonts.fontconfig = {
    enable = true;
    defaultFonts = {
      serif = [ "Sarasa UI SC" ];
      sansSerif = [ "Noto Sans CJK SC" ];
      monospace = [ "Maple Mono NL NF CN" "Fira Code" ];
      emoji = [ "Noto Color Emoji" ];
    };
    
  };

  xdg.configFile."niri/config.kdl".source = ./configs/niri/config.kdl;
  home.stateVersion = "25.11";
}
