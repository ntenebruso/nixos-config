{
  config,
  pkgs,
  lib,
  ...
}:

{
  programs.hyprlock = {
    enable = true;

    settings = {
      label = {
        text = "$TIME12";
        font_size = 102;
        position = "0, 175";
        halign = "center";
        valign = "center";
        font_family = "Mononoki Nerd Font";
        color = "rgb(${config.lib.stylix.colors.base05})";
      };

      input-field = {
        size = "200, 50";
      };

      background = {
        blur_passes = 3;
        blur_size = 4;
      };
    };
  };
}
