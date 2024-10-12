{
  config,
  pkgs,
  lib,
  ...
}:

{
  programs.hyprlock = {
    enable = true;

    extraConfig = builtins.readFile ./hyprlock.conf;
  };
}
