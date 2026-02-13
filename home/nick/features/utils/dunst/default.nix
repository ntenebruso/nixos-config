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
        corner_radius = 10;
        font = "JetBrainsMono Nerd Font";
        follow = "mouse";

        background = "#272822";
        foreground = "#f8f8f2";
        highlight = "#a6e22e";
        frame_color = "#383830";
        timeout = 10;
      };
      urgency_critical = {
        frame_color = "#f92672";
        foreground = "#f92672";
      };
    };
  };
}
