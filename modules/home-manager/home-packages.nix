{ lib, config, pkgs, ... }:

let
  cfg = config.home-packages;
in
{
  options.home-packages = {
    enable 
      = lib.mkEnableOption "enable standard home packages module";
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
        vesktop
        google-chrome
        vscode
        bitwarden-desktop
        dconf2nix
        blackbox-terminal
        spotify
        gnome-tweaks
    ];
  };
}
