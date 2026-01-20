{ ... }:

{
  dconf = {
    enable = true;
    settings = {
      "org/gnome/shell" = {
        enabled-extensions = [
          "blur-my-shell@aunetx"
          "appindicatorsupport@rgcjonas.gmail.com"
          "kimpanel@kde.org"
          "dash-to-dock@micxgx.gmail.com"
          "caffeine@patapon.info"
        ];
      };
    };
  };
}
