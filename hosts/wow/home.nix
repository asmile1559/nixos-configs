{ pkgs, ... }:

{

  imports = [
    ./home-programs
  ];

  home = {
    username = "dub";
    homeDirectory = "/home/dub";
    shell = {
      enableZshIntegration = true;
    };
  };

  home.stateVersion = "25.11";
}
