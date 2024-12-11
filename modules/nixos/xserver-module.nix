{
  lib,
  config,
  pkgs,
  inputs,
  ...
}:

{
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
}
