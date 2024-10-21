{
  config,
  pkgs,
  lib,
  ...
}:

{
  home.file.".local/share/wallpapers" = {
    source = ./pictures;
    recursive = true;
  };
}
