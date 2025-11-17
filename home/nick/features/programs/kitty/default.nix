{
  config,
  pkgs,
  lib,
  ...
}:

{
  programs.kitty = {
    enable = true;
    settings = {
      adjust_line_height = 1;
    };
  };
}
