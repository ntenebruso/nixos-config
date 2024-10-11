{
  config,
  pkgs,
  lib,
  ...
}:

{
  home.packages = with pkgs; [
    nwg-displays
    grim
    slurp
  ];

  wayland.windowManager.hyprland = {
    enable = true;

    systemd.enable = true;
  };

#  programs.hyprlock = {
#    enable = true;
#  };

#  services.hypridle = {
#    enable = true;
#  };

#  services.hyprpaper = {
#    enable = true;
#  };

  programs.alacritty = {
    enable = true;
  };

  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
  };

  programs.waybar = {
    enable = true;
  };
}
