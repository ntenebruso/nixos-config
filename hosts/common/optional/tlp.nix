{
  config,
  pkgs,
  lib,
  ...
}:

{
  services.tlp.enable = true;
  services.power-profiles-daemon.enable = false;
}
