{
  config,
  pkgs,
  lib,
  ...
}:

{
  imports = [
    ./../../utils/hyprpaper
    ./../../utils/waybar
    ./../../utils/hyprlock
    ./../../utils/hypridle
    ./../../utils/dunst
    ./../../wallpapers
    ./../../programs/alacritty
  ];

  wayland.windowManager.hyprland = {
    enable = true;

    extraConfig = builtins.readFile ./hyprland.conf;
    systemd = {
      enable = true;
      variables = [ "--all" ];
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

    # Fonts
    nerd-fonts.jetbrains-mono
    nerd-fonts.mononoki
  ];

  services.network-manager-applet.enable = true;
  services.blueman-applet.enable = true;

  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
    theme = "gruvbox-dark";
  };
}
