{
  config,
  pkgs,
  lib,
  ...
}:

{
  services.hypridle = {
    enable = true;

    settings = {
      general = {
        lock_cmd = "dms ipc call lock lock";
        before_sleep_cmd = "loginctl lock-session";
        inhibit_sleep = 3;
      };

      listener = [
        {
          timeout = 270;
          on-timeout = "brightnessctl -s set 10";
          on-resume = "brightnessctl -r";
        }
        {
          timeout = 300;
          on-timeout = "hyprctl dispatch dpms off";
          on-resume = "hyprctl dispatch dpms on";
        }
        {
          timeout = 600;
          on-timeout = "systemctl suspend";
        }
      ];
    };
  };
}
