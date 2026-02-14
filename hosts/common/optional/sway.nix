{
  config,
  pkgs,
  lib,
  ...
}:

{
  security.polkit.enable = true;

  programs.sway = {
    enable = true;
    package = pkgs.swayfx;
  };

  security.pam.services.gtklock = { };

  xdg.portal = {
    enable = true;
    wlr.enable = true;
  };

  programs.uwsm = {
    enable = true;
    waylandCompositors = {
      hyprland = {
        prettyName = "Sway (uwsm)";
        binPath = "/run/current-system/sw/bin/sway";
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
}
