{
  config,
  pkgs,
  lib,
  ...
}:

{
  services.hyprpaper = {
    enable = true;
    settings = {
      ipc = "off";
      preload = "~/.local/share/wallpapers/gruvbox-dark-blue.png";
      wallpaper = ",~/.local/share/wallpapers/gruvbox-dark-blue.png";
    };
  };
}
