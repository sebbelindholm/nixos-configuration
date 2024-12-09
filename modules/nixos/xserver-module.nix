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
    services.xserver.enable = true;
    services.xserver.desktopManager.budgie.enable = true;
    xdg.portal.enable = true;

    programs.hyprland = {
      enable = false;
      xwayland.enable = true;
      package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
      portalPackage =
        inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
    };

    services.xserver.xkb = {
      layout = "se";
      variant = "";
    };
  };
}
