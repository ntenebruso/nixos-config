{
  config,
  pkgs,
  lib,
  ...
}:

{
  programs.neovim = {
    enable = true;
    initLua = builtins.readFile ./config/init.lua;
  };
}
