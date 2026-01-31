{ pkgs, ... }:

{
  programs.vscode = {
    enable = true;
    mutableExtensionsDir = false;
    profiles.default = {
      enableExtensionUpdateCheck = false;
      enableUpdateCheck = false;
      extensions =
        with pkgs.vscode-extensions;
        [
          jnoortheen.nix-ide
          usernamehw.errorlens
          rust-lang.rust-analyzer
          ms-python.python
          ms-python.debugpy
          github.github-vscode-theme
          catppuccin.catppuccin-vsc-icons
          ms-vscode-remote.vscode-remote-extensionpack
          ms-vscode-remote.remote-containers
          ms-vscode-remote.remote-ssh
          ms-vscode.remote-explorer
          github.copilot
          github.copilot-chat
          golang.go
          mkhl.direnv
          vadimcn.vscode-lldb
          tamasfe.even-better-toml
          gruntfuggly.todo-tree
          fill-labs.dependi
          vscodevim.vim
        ]
        ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
          {
            name = "KDL";
            publisher = "kdl-org";
            version = "2.1.3";
            sha256 = "Jssmb5owrgNWlmLFSKCgqMJKp3sPpOrlEUBwzZSSpbM=";
          }
          {
            name = "remote-server";
            publisher = "ms-vscode";
            version = "1.5.3";
            sha256 = "MSayIBwvSgIHg6gTrtUotHznvo5kTiveN8iSrehllW0=";
          }
        ];
      userSettings = {
        "[nix]".editor.tabSize = 2;
        "[kdl]".editor.tabSize = 2;
        "[json]".editor.tabSize = 2;
        workbench.colorTheme = "GitHub Dark";
        workbench.iconTheme = "catppuccin-mocha";

        nix.enableLanguageServer = true;
        nix.serverPath = [ "nixd" ];
        nix.serverSettings = {
          nixd = {
            formatting = {
              command = [ "nixfmt" ];
            };
          };
        };
        editor.fontFamily = "'Maple Mono NL NF CN', 'Fira Code'";
        files.autoSave = "afterDelay";
        editor.formatOnSave = true;
        window.restoreWindows = "none";
      };
    };
  };
}
