{
  config,
  pkgs,
  lib,
  ...
}:

{
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
  };

  environment.systemPackages = with pkgs; [
    pkgs.vanilla-dmz
  ];
}
