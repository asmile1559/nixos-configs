{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    nur.repos.hexadecimalDinosaur.ttf-ms-win11.default
    nur.repos.hexadecimalDinosaur.ttf-ms-win11.zh-cn
  ];
}
