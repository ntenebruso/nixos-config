{
  config,
  pkgs,
  lib,
  ...
}:

{
  programs.tmux = {
    enable = true;
    keyMode = "vi";
    extraConfig = ''
      set -g default-terminal "screen-256color"
    '';
  };
}
