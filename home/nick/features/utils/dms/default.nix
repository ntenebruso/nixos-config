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
      controlCenterWidgets = [
        {
          id = "volumeSlider";
          enable = true;
          width = 50;
        }
        {
          id = "brightnessSlider";
          enable = true;
          width = 50;
        }
        {
          id = "wifi";
          enable = true;
          width = 50;
        }
        {
          id = "bluetooth";
          enable = true;
          width = 50;
        }
        {
          id = "audioOutput";
          enable = true;
          width = 50;
        }
        {
          id = "audioInput";
          enable = true;
          width = 50;
        }
        {
          id = "nightMode";
          enable = true;
          width = 50;
        }
        {
          id = "darkMode";
          enable = true;
          width = 50;
        }
        {
          id = "idleInhibitor";
          enable = true;
          width = 50;
        }
        {
          id = "colorPicker";
          enable = true;
          width = 50;
        }
      ];
    };
    session = {
      wallpaperPath = "/home/nick/.local/share/wallpapers/forest.jpg";
    };
  };
}
