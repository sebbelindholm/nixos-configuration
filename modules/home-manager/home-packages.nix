{
  lib,
  config,
  pkgs,
  ...
}:

let
  cfg = config.home-packages;
in
{
  options.home-packages = {
    enable = lib.mkEnableOption "enable standard home packages module";
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      kitty
      vesktop
      lazygit
      neofetch
      bitwarden-desktop
      spotify
      gnome-tweaks
    ];
  };
}
