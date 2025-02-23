{
  config,
  pkgs,
  lib,
  ...
}:

{
  imports = [
    ./shortcuts.nix
    ./../../wallpapers
  ];

  home.packages = with pkgs; [
    kde-gruvbox
    wl-clipboard
    kdePackages.yakuake
    vlc
  ];

  programs.plasma = {
    enable = true;
    workspace = {
      lookAndFeel = "org.kde.breezedark.desktop";
      colorScheme = "Gruvbox";
      wallpaper = ./../../wallpapers/pictures/sunset.png;
    };
    kscreenlocker.appearance = {
      wallpaper = ./../../wallpapers/pictures/sunset.png;
    };
    session = {
      sessionRestore.restoreOpenApplicationsOnLogin = "startWithEmptySession";
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

  xdg.mimeApps = {
    enable = true;

    defaultApplications = {
      # Firefox
      "text/html" = [ "firefox.desktop" ];
      "x-scheme-handler/http" = [ "firefox.desktop" ];
      "x-scheme-handler/https" = [ "firefox.desktop" ];

      # Thunderbird
      "message/rfc822" = [ "thunderbird.desktop" ];
      "x-scheme-handler/mailto" = [ "thunderbird.desktop" ];
      "text/calendar" = [ "thunderbird.desktop" ];
      "text/x-vcard" = [ "thunderbird.desktop" ];
    };
  };

  xdg.autostart = {
    enable = true;
    entries = [
      "${pkgs.kdePackages.yakuake}/share/applications/org.kde.yakuake.desktop"
    ];
  };
}
