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
}
