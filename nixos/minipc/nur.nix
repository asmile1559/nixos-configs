{ pkgs, inputs, ... }:

{
  imports = [
    inputs.nur.modules.nixos.default
  ];
  fonts.packages = with pkgs; [
    nur.repos.hexadecimalDinosaur.ttf-ms-win11.default
    nur.repos.hexadecimalDinosaur.ttf-ms-win11.zh-cn
  ];
}
