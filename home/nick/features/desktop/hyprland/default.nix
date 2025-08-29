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

    settings = {
      general."col.active_border" = lib.mkForce "rgb(${config.lib.stylix.colors.base0B})";
    };
    extraConfig = builtins.readFile ./hyprland.conf;
    systemd = {
      enable = false;
    };
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

      # pcmanfm
      "inode/directory" = [ "pcmanfm.desktop" ];
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
    pcmanfm

    # Image viewer
    kdePackages.gwenview

    # Archive manager
    kdePackages.ark

    # PDF viewer
    kdePackages.okular

    # Calculator
    kdePackages.kcalc

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
    package = pkgs.rofi-wayland;
  };
}
