{
  config,
  pkgs,
  lib,
  ...
}:

{
  home.packages = with pkgs; [
    flameshot
    grim
  ];

  services.flameshot = {
    enable = true;
    settings = {
      General = {
        saveAsFileExtension = ".png";

        useGrimAdapter = true;
        disabledGrimWarning = true;
      };
    };
  };
}
