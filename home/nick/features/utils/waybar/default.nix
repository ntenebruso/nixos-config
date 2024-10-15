{
  config,
  pkgs,
  lib,
  ...
}:

{
  programs.waybar = {
    enable = true;

    style = builtins.readFile ./style.css;

    settings = {
      mainBar = {
        layer = "top";
        spacing = 4;
        modules-left = [ "hyprland/workspaces" "mpris" ];
        modules-center = [ "clock" ];
        modules-right = [ "idle_inhibitor" "pulseaudio" "cpu" "memory" "temperature" "backlight" "battery" "battery#bat2" "tray" ];

        # MPRIS
        mpris = {
          format = "{player_icon} {dynamic}";
          format-paused = "{status_icon} <i>{dynamic}</i>";
          format-stopped = "{status_icon} Nothing currently playing";
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
          format = "<span color='#b8bb26'>{icon}</span>";
          format-icons = {
            activated = " ";
            deactivated = " ";
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
          format = "<span color='#b8bb26'> </span> {usage}%";
          tooltip = false;
        };

        # Memory usage indicator
        memory = {
          format = "<span color='#b8bb26'> </span> {}%";
        };

        # Temperature monitor
        temperature = {
          # thermal-zone = 2;
          # hwmon-path = "/sys/class/hwmon/hwmon2/temp1_input";
          critical-threshold = 80;
          # format-critical = "{temperatureC}°C {icon}";
          format = "<span color='#b8bb26'>{icon}</span> {temperatureC}°C";
          format-icons = ["" "" ""];
        };

        backlight = {
          # device = "acpi_video1";  # This line is commented out
          format = "<span color='#b8bb26'>{icon}</span> {percent}%";
          format-icons = ["󰃞 " "󰃟 " "󰃠 "];
        };

        # Battery usage
        battery = {
          states = {
            # good = 95;  # This line is commented out
            warning = 30;
            critical = 15;
          };
          format = "<span color='#b8bb26'>{icon}</span> {capacity}%";
          format-charging = "<span color='#b8bb26'> </span> {capacity}%";
          format-plugged = "<span color='#b8bb26'> </span> {capacity}%";
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
          format = "<span color='#b8bb26'>{icon}</span> {volume}% {format_source}";
          format-bluetooth = "<span color='#b8bb26'>{icon}</span> {volume}% {format_source}";
          format-bluetooth-muted = "<span color='#b8bb26'>{icon}</span>   {format_source}";
          format-muted = "<span color='#b8bb26'> </span> {format_source}";
          format-source = "<span color='#b8bb26'></span> {volume}%";
          format-source-muted = "<span color='#b8bb26'> </span>";
          format-icons = {
            headphone = " ";
            hands-free = " ";
            headset = " ";
            phone = " ";
            portable = " ";
            car = " ";
            default = [" " " " " "];
          };
          on-click = "pavucontrol";
        };
      };
    };
  };
}
