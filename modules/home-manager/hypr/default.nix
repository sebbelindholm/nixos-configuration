{
  lib,
  config,
  pkgs,
  inputs,
  ...
}:
{
  imports = [
    ./hyprland.nix
    ./rofi.nix
    ./dunst.nix
  ];
  home.packages = with pkgs; [
    hyprshot
    ranger
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
    networkmanager
    nautilus
    rofi-wayland
    cliphist
    wl-clipboard
    wl-clip-persist
    waybar
    hyprpicker
    avizo
    swaynotificationcenter
  ];

  home.sessionVariables = {
    XDG_CURRENT_DESKTOP = "Hyprland";
    XDG_SESSION_TYPE = "wayland";
    XDG_SESSION_DESKTOP = "Hyprland";
    GDK_BACKEND = "wayland,x11,*";
  };
  home.file.".config/waybar/style.css".source = ./configs/waybar/style.css;
  home.file.".config/waybar/config".source = ./configs/waybar/config;
  home.file.".config/hypr/hyprlock.conf".source = ./hyprlock.conf;
  home.file.".config/hypr/hypridle.conf".source = ./hypridle.conf;
}
