{
  lib,
  config,
  pkgs,
  ...
}:

let
  cfg = config.kitty;
in
{
  options.kitty = {
    enable = lib.mkEnableOption "enable kitty module";
  };

  config = lib.mkIf cfg.enable {
    programs.kitty = {
      enable = true;
      settings = {
        confirm_os_window_close = 0;
        dynamic_background_opacity = true;
        background_opacity = 0.7;
        background_blur = 1;
      };
      themeFile = "tokyo_night_night";
      font.name = "JetbrainsMono Nerd Font";
      font.size = 14;
    };
  };
}
