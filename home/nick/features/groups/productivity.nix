{
  config,
  pkgs,
  lib,
  ...
}:

{
  # All my productivity-related packages for desktop
  imports = [
    ./../programs/firefox
    ./../programs/emacs
    ./../programs/vscodium
    ./../programs/thunderbird
  ];

  home.packages = with pkgs; [
    libreoffice
    veracrypt
  ];

  programs.neovim.enable = true;
}
