{
  config,
  pkgs,
  lib,
  ...
}:

{
  home.pointerCursor = {
    size = 24;
    package = pkgs.vanilla-dmz;
    name = "Vanilla-DMZ";
    gtk.enable = true;
    x11.enable = true;
  };

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
  };

  gtk = {
    enable = true;

    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
    };

    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
    };

    font = {
      name = "Cantarell";
      package = pkgs.cantarell-fonts;
      size = 11;
    };

    theme = {
      name = "Gruvbox-Green-Dark";
      package = (pkgs.gruvbox-gtk-theme.override { themeVariants = [ "green" ]; });
    };

    iconTheme = {
      name = "Adwaita";
      package = pkgs.adwaita-icon-theme;
    };
  };

  qt = {
    enable = true;
    style.name = "adwaita-dark";
  };
}
