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
  ];

  fonts = {
    fontconfig = {
      enable = true;
      defaultFonts = {
        emoji = [ "Noto Fonts Emoji" ];
        monospace = [ "JetBrainsMono Nerd Font Mono" ];
      };
    };
  };

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      accent-color = "green";
      color-scheme = "prefer-dark";
    };
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
  };

  programs.ghostty.settings = {
    theme = "Kitty Default";
  };
}
