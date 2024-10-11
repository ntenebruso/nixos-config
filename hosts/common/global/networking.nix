{
  config,
  pkgs,
  lib,
  ...
}:

{
  # Enable NetworkManager
  networking.networkmanager.enable = true;
}
