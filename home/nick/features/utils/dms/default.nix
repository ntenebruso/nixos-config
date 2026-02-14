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
    settings = {
      currentThemeName = "green";
      launchPrefix = "uwsm app -- ";
    };
  };
}
