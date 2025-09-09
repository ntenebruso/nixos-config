{
  config,
  pkgs,
  lib,
  ...
}:

{
  # Fonts
  fonts.fontconfig.enable = true;
  home.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-cjk-serif
    corefonts
    adwaita-icon-theme
  ];

  stylix = {
    enable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
    image = ../wallpapers/pictures/blackhole.png;
    polarity = "dark";

    fonts = {
      serif = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Serif";
      };

      sansSerif = {
        package = pkgs.ubuntu-sans;
        name = "Ubuntu Sans";
      };

      monospace = {
        package = pkgs.nerd-fonts.mononoki;
        name = "Mononoki Nerd Font Mono";
      };

      emoji = {
        package = pkgs.noto-fonts-color-emoji;
        name = "Noto Color Emoji";
      };
    };

    cursor = {
      size = 24;
      package = pkgs.vanilla-dmz;
      name = "Vanilla-DMZ";
    };

    icons = {
      enable = true;
      package = pkgs.adwaita-icon-theme;
      dark = "Adwaita";
      light = "Adwaita";
    };

    targets.neovim.enable = false;
  };

  qt = {
    enable = true;
    style.name = "adwaita-dark";
  };
}
