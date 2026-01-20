{
  config,
  pkgs,
  lib,
  ...
}:

{
  imports = [
    ./theme.nix
  ];

  dconf.settings = {
    "org/gnome/mutter" = {
      experimental-features = [ "scale-monitor-framebuffer" "xwayland-native-scaling" ];
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
        pkgs.gnomeExtensions.caffeine.extensionUuid
        pkgs.gnomeExtensions.forge.extensionUuid
        pkgs.gnomeExtensions.dash-to-dock.extensionUuid
        "user-theme@gnome-shell-extensions.gcampax.github.com"
      ];
      favorite-apps = [
        "firefox.desktop"
        "org.gnome.Calendar.desktop"
        "org.gnome.Music.desktop"
        "org.gnome.TextEditor.desktop"
        "org.gnome.Nautilus.desktop"
      ];
    };
    # "org/gnome/shell/extensions/user-theme" = {
    #   name = "Gruvbox-Green-Dark";
    # };
    "org/gnome/desktop/sound" = {
      event-sounds = false;
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
    gnomeExtensions.caffeine
    gnomeExtensions.forge
    gnomeExtensions.dash-to-dock
  ];
}
