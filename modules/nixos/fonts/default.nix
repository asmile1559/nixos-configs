{ pkgs, ... }:

{
  fonts.packages = with pkgs; [
    noto-fonts-color-emoji
    fira-code
    fira-code-symbols
    maple-mono.NL-NF-CN
  ];

  fonts.fontconfig = {
    enable = true;
    defaultFonts = {
      serif = [ "Microsoft YaHei" ];
      sansSerif = [ "Microsoft YaHei" ];
      monospace = [
        "Maple Mono NL NF CN"
        "Fira Code"
      ];
      emoji = [ "Noto Color Emoji" ];
    };
  };

  fonts.fontDir.enable = true;
  
}
