{ pkgs, ... }:

{
  fonts.packages = with pkgs; [
    noto-fonts-color-emoji
    fira-code
    fira-code-symbols
    maple-mono.NL-NF-CN
  ];
}
