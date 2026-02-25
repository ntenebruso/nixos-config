{
  config,
  pkgs,
  lib,
  ...
}:

{
  imports = [
    ./../../utils/hypridle
    ./../../wallpapers
    ./../../programs/ghostty
    ./theme.nix
    ./../../utils/dms
    ./../../programs/rofi
  ];

  wayland.windowManager.hyprland = {
    enable = true;

    systemd = {
      enable = false;
    };

    plugins = with pkgs; [
      hyprlandPlugins.hy3
    ];

    extraConfig = builtins.readFile ./hyprland.conf;
  };

  # Ozone for chromium apps
  home.sessionVariables.NIXOS_OZONE_WL = "1";

  gtk.gtk3.bookmarks = [
    "file:///home/nick/Documents/School"
    "file:///home/nick/Documents"
    "file:///home/nick/Downloads"
    "file:///home/nick/Pictures"
    "file:///home/nick/Videos"
  ];

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

      # pcmanfm
      "inode/directory" = [ "nautilus.desktop" ];

      # Documents
      "application/pdf" = [ "org.gnome.Evince.desktop" ];
    };
  };

  home.packages = with pkgs; [
    # Display editor
    nwg-displays

    # Volume control
    pavucontrol

    # Fastfetch (will be moved from this file once I organize everything :) )
    fastfetch

    # File manager
    nautilus

    # Image viewer
    loupe

    # Archive manager
    kdePackages.ark

    # PDF viewer
    evince

    # Calculator
    gnome-calculator

    # Clipboard support
    wl-clipboard

    # Media player
    vlc
  ];
}
