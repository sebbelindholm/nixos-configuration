{ lib, config, pkgs, ... }:

let
  cfg = config.kitty;
in
{
  options.kitty = {
    enable 
      = lib.mkEnableOption "enable kitty module";
  };

  config = lib.mkIf cfg.enable {
        programs.kitty = {
            enable = true;
            settings = {
                confirm_os_window_close = 0;
            };
            theme = "Tokyo Night";
            font.name = "JetbrainsMono Nerd Font";
            font.size = 14;
        };
  };
}
