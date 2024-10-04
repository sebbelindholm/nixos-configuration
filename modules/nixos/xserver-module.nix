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

    environment.sessionVariables.NIXOS_OZONE_WL = "1";
    nixpkgs.config.google-chrome.commandLineArgs = "--enable-features=UseOzonePlatform --ozone-platform=wayland --ignore-gpu-blocklist
--enable-zero-copy --enable-features=VaapiVideoDecodeLinuxGL";

    services.xserver.displayManager.gdm.enable = true;
    services.xserver.desktopManager.gnome.enable = false;
    programs.hyprland = {
      enable = true;
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
