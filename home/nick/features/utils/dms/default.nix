{
  config,
  pkgs,
  lib,
  ...
}:

{
  programs.dank-material-shell = {
    enable = true;
    systemd = {
      enable = true;
      restartIfChanged = true;
    };
    enableCalendarEvents = false;
    settings = builtins.fromJSON (builtins.readFile ./settings.json);
    session = {
      wallpaperPath = "/home/nick/.local/share/wallpapers/forest.jpg";
    };
  };
}
