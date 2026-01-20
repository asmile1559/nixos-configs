{ pkgs, inputs, ... }:

{
  home = {
    username = "dub";
    homeDirectory = "/home/dub";
    shell = {
      enableZshIntegration = true;
    };
  };
}
