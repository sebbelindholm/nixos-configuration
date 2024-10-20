{ config, ... }:

{
  services.dunst = {
    enable = true;
    settings = {
      global = {
        follow = "keyboard";
        width = 300;
        height = 200;
        origin = "top-center";
        padding = 10;
        gap_size = 10;
        font = "JetbrainsMono Nerd Font 12";
        corner_radius = 10;
      };
      urgency_normal = {
        background = "#${config.colorScheme.palette.base00}";
        foregorund = "#${config.colorScheme.palette.base05}";
        highlight = "#${config.colorScheme.palette.base07}";
        frame_color = "#${config.colorScheme.palette.base06}";
      };
    };
  };
}
