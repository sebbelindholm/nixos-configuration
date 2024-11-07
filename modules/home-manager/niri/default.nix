{
  lib,
  config,
  pkgs,
  inputs,
  ...
}:

let
  cfg = config.niri;
in
{
  imports =
    [
    ];

  options.niri = {
    enable = lib.mkEnableOption "enable niri module";
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      hyprshot
      playerctl
      pavucontrol
      blueman
      rofi-power-menu
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

    home.sessionVariables =
      {
      };

    home.file.".config/niri/config.kdl".source = ./config.kdl;

  };
}
