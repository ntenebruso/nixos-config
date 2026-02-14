{
  config,
  pkgs,
  lib,
  ...
}:

{
  home.packages = with pkgs; [
    noto-fonts-color-emoji
    nerd-fonts.jetbrains-mono
    corefonts
    vista-fonts
    freefont_ttf
  ];

  fonts = {
    fontconfig = {
      enable = true;
      defaultFonts = {
        serif = [ "FreeSerif" ];
        sansSerif = [ "FreeSans" ];
        emoji = [ "Noto Fonts Emoji" ];
        monospace = [ "JetBrainsMono Nerd Font Mono" ];
      };
    };
  };

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
  };

  home.pointerCursor = {
    enable = true;
    size = 24;
    package = pkgs.vanilla-dmz;
    name = "Vanilla-DMZ";
    gtk.enable = true;
    x11.enable = true;
  };

  gtk = {
    enable = true;

    gtk3 = {
      enable = true;
      theme = {
        name = "adw-gtk3-dark";
        package = pkgs.adw-gtk3;
      };
    };

    iconTheme = {
      package = pkgs.adwaita-icon-theme;
      name = "Adwaita";
    };

    font = {
      package = pkgs.adwaita-fonts;
      name = "Adwaita Sans";
    };
  };

  programs.ghostty.settings = {
    theme = "Kitty Default";
  };
}
