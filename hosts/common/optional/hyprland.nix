{
  config,
  pkgs,
  lib,
  ...
}:

{
  # Enable hyprland
  programs.hyprland.enable = true;

  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --sessions ${pkgs.hyprland}/share/wayland-sessions";
      };
      terminal = {
        vt = 7;
      };
    };
  };

  # To make blueman-applet work
  services.blueman.enable = true;

  systemd.services.greetd.serviceConfig = {
    Type = "idle";
    StandardInput = "tty";
    StandardOutput = "tty";
    StandardError = "journal"; # Without this errors will spam on screen
    # Without these bootlogs will spam on screen
    TTYReset = true;
    TTYVHangup = true;
    TTYVTDisallocate = true;
  };
}
