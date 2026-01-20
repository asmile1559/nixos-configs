{ ... }:

{
  programs.starship = {
    enable = true;
    settings = {
      add_newline = true;
      format = "$os$time$all$character";
      directory = {
        truncation_length = 3;
        truncation_symbol = "../";
      };
      character = {
        success_symbol = "[ ](bold green)";
        error_symbol = "[✘ ](bold red)";
      };
      os = {
        disabled = false;
        symbols = {
          NixOS = " ";
        };
        format = "[$symbol ]($style)";
      };
      time = {
        disabled = false;
        time_format = "%T";
        format = "at [$time ]($style)";
      };
      direnv = {
        disabled = false;
      };
    };
  };
}
