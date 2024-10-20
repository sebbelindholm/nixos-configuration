{
  lib,
  config,
  pkgs,
  inputs,
  ...
}:

let
  cfg = config.hypr;
in
{
  imports = [
    ./hyprland.nix
    ./rofi.nix
    ./dunst.nix
    ./waybar.nix
  ];

  options.hypr = {
    enable = lib.mkEnableOption "enable hypr module";
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      hyprshot
      blueman
      pamixer
      udiskie
      hyprlock
      hypridle
      swaybg
      brightnessctl
      wf-recorder
      wl-clipboard
      networkmanager
      nautilus
      rofi-wayland
      cliphist
      wl-clipboard
      wl-clip-persist
    ];

    home.sessionVariables = {
      XDG_CURRENT_DESKTOP = "Hyprland";
      XDG_SESSION_TYPE = "wayland";
      XDG_SESSION_DESKTOP = "Hyprland";
    };

  };
}
