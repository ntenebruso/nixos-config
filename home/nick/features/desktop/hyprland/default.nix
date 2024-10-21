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

  home.packages = with pkgs; [
    nwg-displays
    grim
    slurp
    pavucontrol
    fastfetch
    pcmanfm
    wl-clipboard
    (nerdfonts.override {
      fonts = [
        "Mononoki"
        "JetBrainsMono"
      ];
    })
  ];

  wayland.windowManager.hyprland = {
    enable = true;

    extraConfig = builtins.readFile ./hyprland.conf;
    systemd = {
      enable = true;
      variables = [ "--all" ];
    };
  };

  services.network-manager-applet.enable = true;
  services.blueman-applet.enable = true;

  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
    theme = "gruvbox-dark";
  };
}
