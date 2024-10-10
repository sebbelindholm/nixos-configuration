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

    nixpkgs.config.google-chrome.commandLineArgs = "--enable-features=UseOzonePlatform --ozone-platform=wayland --ignore-gpu-blocklist
--enable-zero-copy --enable-features=VaapiVideoDecodeLinuxGL";

    services.xserver.displayManager.lightdm.enable = false;
    services.xserver.desktopManager.budgie.enable = false;
    services.desktopManager.cosmic.enable = true;
    services.displayManager.cosmic-greeter.enable = true;
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
