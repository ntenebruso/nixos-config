{
  config,
  pkgs,
  lib,
  ...
}:

{
  home.packages = with pkgs; [
    libnotify
    brightnessctl
  ];

  home.file = {
    ".local/bin" = {
      source = ./bin;
      recursive = true;
    };
  };

  home.sessionPath = [ "$HOME/.local/bin" ];
}
