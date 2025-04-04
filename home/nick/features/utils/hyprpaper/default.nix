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
    };
  };
}
