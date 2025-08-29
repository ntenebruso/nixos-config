{
  config,
  pkgs,
  lib,
  ...
}:

{
  # Enable hyprland
  programs.hyprland.enable = true;

  programs.uwsm = {
    enable = true;
    waylandCompositors = {
      hyprland = {
        prettyName = "Hyprland";
        binPath = "/run/current-system/sw/bin/Hyprland";
      };
    };
  };

  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.tuigreet}/bin/tuigreet --time --remember-session";
      };
    };
  };

  # To make blueman-applet work
  services.blueman.enable = true;

#  systemd.services.greetd.serviceConfig = {
#    Type = "idle";
#    StandardInput = "tty";
#    StandardOutput = "tty";
#    StandardError = "journal"; # Without this errors will spam on screen
#    # Without these bootlogs will spam on screen
#    TTYReset = true;
#    TTYVHangup = true;
#    TTYVTDisallocate = true;
#  };
}
