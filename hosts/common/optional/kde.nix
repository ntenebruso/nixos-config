{
  config,
  pkgs,
  lib,
  ...
}:

{
  # Enable the X11 windowing system.
  # You can disable this if you're only using the Wayland session.
  services.xserver.enable = true;

  # Enable SDDM
  services.displayManager.sddm.enable = true;

  # Enable Plasma
  services.desktopManager.plasma6.enable = true;
}
