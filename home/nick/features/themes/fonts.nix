{
  config,
  pkgs,
  lib,
  ...
}:

{
  # Fonts
  fonts.fontconfig.enable = true;
  home.packages = with pkgs; [
    noto-fonts
    noto-fonts-color-emoji
    noto-fonts-cjk-sans
    noto-fonts-cjk-serif
    nerd-fonts.jetbrains-mono
    corefonts
  ];
}
