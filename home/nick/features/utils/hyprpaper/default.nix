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
      preload = "${./wallpaper.png}";
      wallpaper = ",${./wallpaper.png}";
    };
  };
}
