{ ... }:

{
  programs.ghostty = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      theme = "Catppuccin Mocha";
      font-family = "Maple Mono NL NF CN";
      working-directory = "home";
      window-inherit-working-directory = false;
    };
  };
}
