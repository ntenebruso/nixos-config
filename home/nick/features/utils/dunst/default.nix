{
  config,
  pkgs,
  lib,
  ...
}:

{
  services.dunst = {
    enable = true;
    settings = {
      global = {
        width = 300;
        height = 300;
        offset = "30x50";
        origin = "top-right";
        frame_color = "#eceff1";
	corner_radius = 10;
        font = "Mononoki Nerd Font";
      };

      urgency_normal = {
        background = "#282828";
        foreground = "#d5c4a1";
        timeout = 10;
      };
    };
  };
}
