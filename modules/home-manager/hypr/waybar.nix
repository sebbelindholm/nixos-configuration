{ config, ... }:
let
  custom = {
    font = "JetBrainsMono Nerd Font";
    font_size = "18px";
    font_weight = "bold";
    text_color = "#FBF1C7";
    background_0 = "#${config.colorScheme.palette.base00}";
    background_1 = "#282828";
    border_color = "#928374";
    red = "#CC241D";
    green = "#98971A";
    yellow = "#FABD2F";
    blue = "#458588";
    magenta = "#B16286";
    cyant = "#689D6A";
    orange = "#D65D0E";
    orange_bright = "#DDDDDD";
    opacity = "1";
    indicator_height = "2px";
  };
in
{
  programs.waybar = {
    enable = true;

    settings.mainBar = with custom; {
      height = 30;
      layer = "top";
      position = "top";

      modules-left = [ ];
      modules-center = [ "clock" ];
      modules-right = [ ];

      battery = {
        format = "{icon} {capacity}%";
        format-alt = "{icon} {time}";
      };

      pulseaudio = {
        format = "{icon} {volume}%";
      };

      clock = {
        format-alt = "{:%Y-%m-%d}";
      };

      "hyprland/workspaces" = {
        format = "{icon}";
        on-click = "activate";
        format-icons = [

        ];
      };
    };
  };
}
