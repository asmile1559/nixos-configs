{ pkgs, ... }:

{
  programs.vscode = {
    enable = true;
    mutableExtensionsDir = false;
    profiles.default = {
      enableExtensionUpdateCheck = false;
      enableUpdateCheck = false;
      extensions = with pkgs.vscode-extensions; [
        jnoortheen.nix-ide
        usernamehw.errorlens
        rust-lang.rust-analyzer
        ms-python.python
        ms-python.vscode-python-envs
        ms-python.vscode-pylance
        ms-python.debugpy
      ] ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
        {
          name = "KDL";
          publisher = "kdl-org";
          version = "2.1.3";
          sha256 = "Jssmb5owrgNWlmLFSKCgqMJKp3sPpOrlEUBwzZSSpbM=";
        }
      ];
      userSettings = {
        "[nix]".editor.tabSize = 2;
        "[kdl]".editor.tabSize = 2;
        "[json]".editor.tabSize = 2;
      };
    };
  };
}
