{
  config,
  pkgs,
  lib,
  ...
}:

{
  dconf.settings = {
    "org/gnome/mutter" = {
      experimental-features = [ "scale-monitor-framebuffer" ];
    };
    "org/gnome/desktop/wm/preferences" = {
      button-layout = "appmenu:minimize,maximize,close";
    };
    "org/gnome/desktop/interface" = {
      clock-format = "12h";
    };
    "org/gnome/shell" = {
      disable-user-extensions = false;
      enabled-extensions = [
        pkgs.gnomeExtensions.appindicator.extensionUuid
        pkgs.gnomeExtensions.blur-my-shell.extensionUuid
        pkgs.gnomeExtensions.paperwm.extensionUuid
        pkgs.gnomeExtensions.dash-to-dock.extensionUuid
        "user-theme@gnome-shell-extensions.gcampax.github.com"
      ];
    };
    "org/gnome/shell/extensions/user-theme" = {
      name = "Gruvbox-Green-Dark";
    };
    "org/gnome/shell/extensions/blur-my-shell/panel" = {
      blur = false;
    };
    "org/gnome/shell/extensions/blur-my-shell/dash-to-dock" = {
      blur = false;
    };
    "org/gnome/shell/extensions/paperwm" = {
      show-window-position-bar = false;
    };
    "org/gnome/Console" = {
      custom-font = "JetBrainsMono Nerd Font 10 Mono";
      audible-bell = false;
    };
  };

  home.packages = with pkgs; [
    # General utils
    wl-clipboard
    gnome-tweaks
    # Gnome Extensions
    gnomeExtensions.appindicator
    gnomeExtensions.blur-my-shell
    gnomeExtensions.paperwm
    gnomeExtensions.dash-to-dock
  ];
}
