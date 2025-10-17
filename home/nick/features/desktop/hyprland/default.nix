{
  config,
  pkgs,
  lib,
  ...
}:

{
  imports = [
    ./../../utils/hyprpaper
    #./../../utils/waybar
    ./../../utils/hyprlock
    ./../../utils/hypridle
    #./../../utils/dunst
    ./../../wallpapers
    ./../../programs/alacritty
    ./../../themes
    ./../../neoshell
  ];

  wayland.windowManager.hyprland = {
    enable = true;

    extraConfig = builtins.readFile ./hyprland.conf;
    systemd = {
      enable = false;
    };
  };

  # Ozone for chromium apps
  home.sessionVariables.NIXOS_OZONE_WL = "1";

  gtk.gtk3.bookmarks = [
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

  # FIX FOR NWG BUILD ISSUE
  nixpkgs.overlays = [
    (final: prev: {
      pythonPackagesExtensions = prev.pythonPackagesExtensions ++ [
         (python-final: python-prev: {
           i3ipc = python-prev.i3ipc.overridePythonAttrs (oldAttrs: {
             doCheck = false;
             });
          })
      ];
     })
  ];

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

    # Additional Fonts
    nerd-fonts.mononoki

    # Redlight Filter
    hyprsunset

    networkmanagerapplet
  ];

  services.network-manager-applet.enable = true;
  services.blueman-applet.enable = true;

  programs.rofi = {
    enable = true;
  };
}
