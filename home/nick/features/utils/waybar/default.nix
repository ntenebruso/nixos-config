{
  config,
  pkgs,
  lib,
  ...
}:

{
  programs.waybar = {
    enable = true;

    systemd = {
      enable = true;
    };

    style = builtins.readFile ./style.css;

    settings = {
      mainBar = {
        layer = "top";
        spacing = 4;
        modules-left = [ "sway/workspaces" "mpris" ];
        modules-center = [ "clock" ];
        modules-right = [
          "idle_inhibitor"
          "custom/separator"
          "pulseaudio"
          "custom/separator"
          "memory"
          "custom/separator"
          "temperature"
          "custom/separator"
          "backlight"
          "custom/separator"
          "battery"
          "custom/separator"
          "tray"
        ];

        "custom/separator" = {
          format = "|";
          interval = "once";
          tooltip = false;
        };

        # MPRIS
        mpris = {
          format = "{player_icon} {dynamic}";
          format-paused = "{status_icon} <i>{dynamic}</i>";
          format-stopped = "{status_icon} Nothing currently playing";
          dynamic-order = [ "title" "artist" "position" "length" ];
          player-icons = {
            default = "▶ ";
            mpv = "🎵";
          };
          status-icons = {
            paused = "⏸ ";
            stopped = "󰓛";
          };
        };

        # Idle Inhibitor
        idle_inhibitor = {
          format = "{icon}";
          format-icons = {
            activated = "󰒳 ";
            deactivated = "󰒲 ";
          };
        };

        # System tray
        tray = {
          # icon-size = 21;
          spacing = 10;
        };

        # Clock
        clock = {
          timezone = "America/New_York";
          format = "{:%I:%M}";
          tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
          format-alt = "{:%Y-%m-%d}";
        };

        # CPU usage indicator
        cpu = {
          format = "cpu {usage}%";
          tooltip = false;
        };

        # Memory usage indicator
        memory = {
          format = "mem {}%";
        };

        # Temperature monitor
        temperature = {
          # thermal-zone = 2;
          # hwmon-path = "/sys/class/hwmon/hwmon2/temp1_input";
          critical-threshold = 80;
          # format-critical = "{temperatureC}°C {icon}";
          format = "temp {temperatureC}°C";
          format-icons = ["" "" ""];
        };

        backlight = {
          # device = "acpi_video1";  # This line is commented out
          format = "  {percent}%";
          format-icons = ["󰃞 " "󰃟 " "󰃠 "];
        };

        # Battery usage
        battery = {
          states = {
            # good = 95;  # This line is commented out
            warning = 20;
            critical = 10;
          };
          format = "{icon} {capacity}%";
#          format-critical = "<span color='#cc241d'>󰂃</span> {capacity}%";
          format-charging = "󰂄 {capacity}%";
          format-plugged = "  {capacity}%";
          format-alt = "{icon} {time}";
          # format-good = "";  # An empty format will hide the module
          # format-full = "";  # This line is commented out
          format-icons = [" " " " " " " " " "];
        };

        # Network monitor
        network = {
          # interface = "wlp2*";  # This line is commented out
          format-wifi = "{essid} ({signalStrength}%)  ";
          format-ethernet = "{ipaddr}/{cidr} ";
          tooltip-format = "{ifname} via {gwaddr} ";
          format-linked = "{ifname} (No IP) ";
          format-disconnected = "Disconnected ⚠ ";
          format-alt = "{ifname}: {ipaddr}/{cidr}";
        };

        # Audio indicator
        pulseaudio = {
          # scroll-step = 1;  # %, can be a float
          format = "{icon} {volume}%";
#          format = "VOL: {volume}%";
#          format-bluetooth = "<span color='#b8bb26'>{icon}</span> {volume}% {format_source}";
#          format-bluetooth-muted = "<span color='#b8bb26'>{icon}</span>   {format_source}";
          format-muted = "  {volume}%";
#          format-source = "<span color='#b8bb26'></span> {volume}%";
#          format-source-muted = "<span color='#b8bb26'> </span>";
          format-icons = {
            headphone = " ";
            phone = " ";
            portable = " ";
            default = [" " " " " "];
          };
          on-click = "pavucontrol";
        };
      };
    };
  };

  # Enable playerctl for music status
  services.playerctld.enable = true;

  home.packages = with pkgs; [
    playerctl
  ];
}
