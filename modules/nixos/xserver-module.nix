{
  lib,
  config,
  pkgs,
  inputs,
  ...
}:

let
  cfg = config.xserver-module;
in
{
  options.xserver-module = {
    enable = lib.mkEnableOption "enable xserver module";
  };

  config = lib.mkIf cfg.enable {
    services.xserver.enable = false;

    xdg.portal.enable = true;

    services.xserver.displayManager.gdm.enable = false;

    programs.hyprland = {
      enable = true;
      xwayland.enable = true;
    };

    services.xserver.xkb = {
      layout = "se";
      variant = "";
    };
  };
}
