{
  config,
  pkgs,
  lib,
  ...
}:

{
  imports = [
    ./../../wallpapers
  ];

  home.packages = with pkgs; [
    kde-gruvbox
    wl-clipboard
    kdePackages.yakuake
  ];

  programs.plasma = {
    enable = true;
    workspace = {
      colorScheme = "Gruvbox";
      wallpaper = ./../../wallpapers/pictures/sunset.png;
    };
    kscreenlocker.appearance = {
      wallpaper = ./../../wallpapers/pictures/sunset.png;
    };
  };

  programs.konsole = {
    enable = true;
    profiles = {
      "Gruvbox" = {
        colorScheme = "Gruvbox";
        font.name = "JetBrainsMono Nerd Font";
      };
    };
    defaultProfile = "Gruvbox";
  };
}
