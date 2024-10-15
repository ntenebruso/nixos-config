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
  ];

  home.packages = with pkgs; [
    nwg-displays
    grim
    slurp
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

  programs.alacritty = {
    enable = true;
  };

  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
    theme = "gruvbox-dark";
  };
}