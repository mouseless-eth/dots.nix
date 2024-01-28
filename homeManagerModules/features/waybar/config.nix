{
  lib,
  config,
  ...
}: let
  monitors = config.myHomeManager.monitors;
  primaryMonitor = lib.lists.findFirst (m: m.primary) "eDP-1" monitors;
in {
  mainBar = {
    #margin = "8px 10px -2px 10px";
    layer = "top";
    # TODO: (find main monitor)
    output = [primaryMonitor.name];

    modules-left = ["custom/logo" "hyprland/workspaces" "hyprland/window"];
    modules-center = [];
    modules-right = ["battery" "cpu" "memory" "backlight" "pulseaudio" "clock" "network" "tray"]; #"custom/powermenu" ];

    /*
    Modules configuration
    */
    "hyprland/workspaces" = {
      active-only = "false";
      on-scroll-up = "hyprctl dispatch workspace e+1";
      on-scroll-down = "hyprctl dispatch workspace e-1";
      disable-scroll = "false";
      format = "{icon}";
      on-click = "activate";
      format-icons = {
        "1" = "1";
        "2" = "2";
        "3" = "3";
        "4" = "4";
        "5" = "5";
        "6" = "6";
        "7" = "7";
        "8" = "8";
        "9" = "9";
        "10" = "10";
      };
    };

    "idle_inhibitor" = {
      format = "{icon}";
      format-icons = {
        activated = " ";
        deactivated = " ";
      };
    };

    "tray" = {
      spacing = 8;
    };

    "clock" = {
      tooltip-format = "<tt><small>{calendar}</small></tt>";
      format = " {:%H:%M}";
      format-alt = " {:%A, %B %d, %Y}";
    };

    "cpu" = {
      format = " {usage}%";
      tooltip = "false";
    };

    "memory" = {
      format = " {}%";
    };

    "backlight" = {
      format = "{icon}{percent}%";
      format-icons = ["󰃞 " "󰃟 " "󰃠 "];
      on-scroll-up = "light -A 1";
      on-scroll-down = "light -U 1";
    };

    "battery" = {
      states = {
        warning = "30";
        critical = "15";
      };
      format = "{icon}{capacity}%";
      tooltip-format = "{timeTo} {capacity}%";
      format-charging = "󱐋{capacity}%";
      format-plugged = " ";
      format-alt = "{time} {icon}";
      format-icons = ["  " "  " "  " "  " "  "];
    };

    "network" = {
      format-wifi = " {essid} {signalStrength}%";
      format-ethernet = "{ifname}: {ipaddr}/{cidr} 󰈀 ";
      format-linked = "{ifname} (No IP) 󰈀 ";
      format-disconnected = "󰤮 Disconnected";
      on-click = "wifi-menu";
      tooltip-format = "{essid} {signalStrength}%";
    };

    "pulseaudio" = {
      format = "{icon}{volume}% {format_source}";
      format-bluetooth = "{icon} {volume}%";
      format-bluetooth-muted = "   {volume}%";
      format-source = "";
      format-source-muted = "";
      format-muted = "  {format_source}";
      format-icons = {
        headphone = " ";
        hands-free = "󰂑 ";
        headset = "󰂑 ";
        phone = " ";
        portable = " ";
        car = " ";
        default = [" " " " " "];
      };
      tooltip-format = "{desc} {volume}%";
      on-click = "pactl set-sink-mute @DEFAULT_SINK@ toggle";
      on-click-right = "pactl set-source-mute @DEFAULT_SOURCE@ toggle";
      on-click-middle = "pavucontrol";
    };

    "custom/logo" = {
      format = " ";
      tooltip = "false";
    };

    "custom/powermenu" = {
      format = " ";
      on-click = "powermenu";
    };
  };
}
