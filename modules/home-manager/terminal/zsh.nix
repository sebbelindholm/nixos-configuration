{ lib, config, pkgs, ... }:

let
  cfg = config.zsh;
in
{
  options.zsh = {
    enable 
      = lib.mkEnableOption "enable zsh module";
  };

  config = lib.mkIf cfg.enable {
    programs = {
        zsh = {
            enable = true;
            autosuggestion.enable = true; 
            enableCompletion = true;
            syntaxHighlighting.enable = true;

            shellAliases = {
              dconf-save = "dconf dump / | dconf2nix > ~/.setup/modules/home-manager/gnome/dconf.nix";
            };
        };

        starship = {
            enable = true;
            settings = {

            };
        };
    };
  };
}