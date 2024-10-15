{
  config,
  pkgs,
  lib,
  ...
}:

{
  gtk = {
    enable = true;
    theme = {
      name = "Adwaita-dark";
      package = pkgs.gnome-themes-extra;
    };
  };

  qt = {
    enable = true;
    style.name = "adwaita-dark";
  };

  home.pointerCursor = {
    size = 24;
    package = pkgs.vanilla-dmz;
    name = "Vanilla-DMZ";
    gtk.enable = true;
  };
}
