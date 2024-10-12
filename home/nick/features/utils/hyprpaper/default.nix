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
      preload = builtins.toString ./wallpaper.png;
      wallpaper = ", " + ./wallpaper.png;
    };
  };
}
