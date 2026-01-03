{ pkgs, ... }:

{
  programs.vscode = {
    enable = true;
    profiles.default = {
      enableExtensionUpdateCheck = false;
      enableUpdateCheck = false;
      extensions = with pkgs.vscode-extensions; [
        jnoortheen.nix-ide
        usernamehw.errorlens
      ];
      userSettings = {
        "[nix]".editor.tabSize = 2;
      };
    };
  };
}
