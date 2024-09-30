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
  imports =
    [
    ];

  options.hypr = {
    enable = lib.mkEnableOption "enable hypr module";
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      hyprshot
      hyprlock
      hypridle
      swaybg
      bun
      dart-sass
      fd
      swww
      brightnessctl
      slurp
      wf-recorder
      wl-clipboard
      swappy
      hyprpicker
      pavucontrol
      networkmanager
      gtk3
    ];

    wayland.windowManager.hyprland = {
      enable = true;
      package = inputs.hyprland.packages.${pkgs.system}.default;

      plugins = [
        #        inputs.hyprland-plugins.packages."${pkgs.system}".overview
        inputs.hyprland-plugins.packages."${pkgs.system}".hyprbars
        #inputs.hyprland-plugins.packages."${pkgs.system}".hyprfocus
      ];
    };

    home.file.".config/hypr" = {
      source = ./hypr;
      recursive = true;
    };
  };
}
