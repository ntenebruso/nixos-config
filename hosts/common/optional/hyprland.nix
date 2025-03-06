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
}
