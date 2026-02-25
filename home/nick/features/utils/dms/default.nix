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
    settings = {
      currentThemeName = "green";
      launchPrefix = "uwsm app -- ";
      use24HourClock = false;
      useFahrenheit = true;
      showWorkspaceIndex = true;
      fontFamily = "JetBrainsMono Nerd Font";
      monoFontFamily = "JetBrainsMono Nerd Font";
    };
    session = {
      wallpaperPath = "/home/nick/.local/share/wallpapers/forest.jpg";
    };
  };
}
