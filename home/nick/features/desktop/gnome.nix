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
    "org/gnome/shell" = {
      disable-user-extensions = false;
      enabled-extensions = [
        pkgs.gnomeExtensions.blur-my-shell.extensionUuid
        pkgs.gnomeExtensions.pop-shell.extensionUuid
        "user-theme@gnome-shell-extensions.gcampax.github.com"
      ];
    };
    "org/gnome/shell/extensions/user-theme" = {
      name = "Gruvbox-Green-Dark";
    };
    "org/gnome/shell/extensions/blur-my-shell/panel" = {
      blur = false;
    };
  };

  home.packages = with pkgs.gnomeExtensions; [
    blur-my-shell
    pop-shell
  ];
}
