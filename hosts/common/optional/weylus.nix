{
  config,
  pkgs,
  lib,
  ...
}:

{
  programs.weylus = {
    enable = true;
    users = [ "nick" ];
    openFirewall = true;
  };
}
