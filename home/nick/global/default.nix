{
  config,
  pkgs,
  lib,
  ...
}:

{
  home = {
    username = "nick";
    homeDirectory = "/home/nick";
    stateVersion = "24.05";
  };

  programs.home-manager.enable = true;
}
