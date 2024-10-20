{
  config,
  pkgs,
  lib,
  ...
}:

{
  services.kanshi = {
    enable = true;
    systemdTarget = "hyprland-session.target";
    settings = [
      {
        profile.name = "docked";
        profile.outputs = [
          {
            criteria = "eDP-1";
            status = "disable";
          }
          {
            criteria = "LG Electronics LG FULL HD 0x01010101";
            mode = "1920x1080@74.97Hz";
          }
        ];
      }
      {
        profile.name = "mobile";
        profile.outputs = [
          {
            criteria = "eDP-1";
            mode = "1920x1200@60.00Hz";
            scale = 1.25;
          }
        ];
      }
    ];
  };
}
