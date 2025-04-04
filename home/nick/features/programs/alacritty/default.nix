{
  config,
  pkgs,
  lib,
  ...
}:

{
  programs.alacritty = {
    enable = true;
    
    settings = {
      font = {
        size = 12;
      };
    };
  };
}
