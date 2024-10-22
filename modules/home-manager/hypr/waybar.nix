{ config, lib, ... }:
{
  programs.waybar = {
    enable = true;

    settings.mainBar = {
      layer = "top";
      position = "top";
      margin-top = 10;
      margin-left = 10;
      margin-right = 10;
      spacing = 10;

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
        format-icons = {
          default = [
            ""
            ""
            ""
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
        on-scroll-up = "exec light -A 2";
        on-scroll-down = "exec light -U 2";
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
          border-radius: 10px;
          padding: 8px;
        }
        #backlight,
        #pulseaudio,
        #clock,
        #tray,
        #battery {
          padding-right: 8px;
          padding-left: 8px;
          padding-top: 2px;
          padding-bottom: 2px;
          margin: 5px;
          background: #${config.colorScheme.palette.base01};
          border-radius: 10px;
          color: #${config.colorScheme.palette.base09};
        }
        #workspaces {
          padding-right: 8px;
          padding-left: 8px;
          padding-top: 2px;
          padding-bottom: 2px;
          margin: 5px;
          border-radius: 10px;
        }
        #workspaces button {
          color: #${config.colorScheme.palette.base09};
          background: #${config.colorScheme.palette.base01};
        }
        #workspaces button.active{
          color: #${config.colorScheme.palette.base01};
          background: #${config.colorScheme.palette.base09};

        }
      '';
    };
  };
}
