{ lib, config, pkgs, ... }:

let
  cfg = config.gnome;
in
{
    imports = [
        ./extensions.nix
        #        ./dconf.nix
    ];

  options.gnome = {
    enable 
      = lib.mkEnableOption "enable gnome module";
  };

  config = lib.mkIf cfg.enable {
    dconf.enable = true;
    home.packages = with pkgs; [
        gnome-extension-manager
    ];
  };
}

