{
  config,
  pkgs,
  lib,
  ...
}:

{
  imports = [
    ./../../programs/rofi
    ./../../programs/ghostty
    ./../../wallpapers
    ./theme.nix
    ./../../utils/waybar
    ./../../utils/dunst
  ];

  wayland.windowManager.sway = {
    enable = true;
    systemd = {
      enable = false;
#      variables = [ "--all" ];
    };
  };

  xdg.configFile."sway/config" = lib.mkForce {
    enable = true;
    source = ./config.in;
  };

  services.gnome-keyring.enable = true;

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
    };
  };

  home.packages = with pkgs; [
    # Display editor
    nwg-displays

    # Polkit
    lxqt.lxqt-policykit

    # Screenshots
    grim
    slurp

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

    # Redlight Filter
    hyprsunset

    # Screen lock
    gtklock

    networkmanagerapplet
  ];

  services.network-manager-applet.enable = true;
  services.blueman-applet.enable = true;
}
