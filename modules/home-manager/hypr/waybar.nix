{ config, lib, ... }:
{
  programs.waybar = {
    enable = true;

    settings.mainBar = {
      layer = "top";
      position = "top";
      output = [
        "DP-1"
        "eDP-1"
      ];

      modules-left = [ "hyprland/workspaces" ];
      modules-center = [ "clock" ];
      modules-right = [
        "tray"
        "battery"
        "backlight"
        "pulseaudio"
      ];

      battery = {
        format = "{icon} {capacity}%";
        format-charging = " {capacity}%";
        format-alt = "{icon} {time} {power}";
        format-icons = [
          ""
          ""
          ""
          ""
          ""
          ""
        ];
      };

      pulseaudio = {
        format = "{icon} {volume}%";
        on-click-right = "pavucontrol";
        format-muted = "󰝟";
        format-icons = {
          default = [
            " "
            " "
            " "
          ];
        };
      };

      clock = {
        format-alt = "{:%Y-%m-%d}";
      };

      tray = {
        spacing = 4;
      };

      backlight = {
        on-scroll-up = "brightnessctl set 5%+";
        on-scroll-down = "brightnessctl set 5%-";
        format = "{icon} {percent}%";
        format-icons = [
          ""
          ""
          ""
          ""
          ""
          ""
          ""
          ""
          ""
        ];
      };

      "hyprland/workspaces" = {
        on-click = "activate";
        all-outputs = "true";
      };
    };
  };
  home.file = {
    ".config/waybar/style.css" = {
      text = ''
        * {
          font-family: JetbrainsMono Nerd Font;
          font-size: 14px;
          font-weight: bold;
          min-height: 0;
        }
        window#waybar {
          background: #${config.colorScheme.palette.base00};
          border-radius: 0px;
          padding: 0px;
        }
        #backlight,
        #pulseaudio,
        #clock,
        #tray,
        #battery {
          padding-right: 6px;
          padding-left: 6px;
          padding-top: 1px;
          padding-bottom: 1px;
          margin-right: 6px;
          border-bottom: 2px solid;
          color: #${config.colorScheme.palette.base09};
        }
        #workspaces {
          padding-right: 6px;
          padding-left: 6px;
          padding-top: 1px;
          padding-bottom: 1px;
          margin: 0px;
          border-radius: 0px;
          color: #${config.colorScheme.palette.base09};
        }
        #workspaces button {
          border-radius: 0px;
        }
        #workspaces button.active{
          border-bottom: 2px solid #${config.colorScheme.palette.base09};

        }
        #backlight {
          border-color: #${config.colorScheme.palette.base0D};
        }
        #pulseaudio {
          border-color: #${config.colorScheme.palette.base0C};
        }
        #clock {
          border-bottom: 0px;
        }
        #battery {
          border-color: #${config.colorScheme.palette.base08};
        }
        #battery.charging {
          border-color: #${config.colorScheme.palette.base0B}
        }
      '';
    };
  };
}
