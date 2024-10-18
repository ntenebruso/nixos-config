{
  config,
  pkgs,
  lib,
  ...
}:

{
  programs.alacritty = {
    enable = true;
    
    settings = {
      font = {
        size = 12;
        normal.family = "Mononoki Nerd Font";
        normal.style = "Regular";
      };
      
      # Default colors
      colors.primary = {
        background = "#282828";
        foreground = "#ebdbb2";
      };

      # Normal colors
      colors.normal = {
        black = "#282828";
        red = "#cc241d";
        green = "#98971a";
        yellow = "#d79921";
        blue = "#458588";
        magenta = "#b16286";
        cyan = "#689d6a";
        white = "#a89984";
      };

      # Bright colors
      colors.bright = {
        black = "#928374";
        red = "#fb4933";
        green = "#b8bb26";
        yellow = "#fabd2f";
        blue = "#83a598";
        magenta = "#d3869b";
        cyan = "#8ec07c";
        white = "#ebdbb2";
      };
    };
  };
}
