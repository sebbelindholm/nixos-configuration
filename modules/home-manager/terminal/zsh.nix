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
                nixos-rebuild = "sudo nixos-rebuild switch --flake ~/.setup#";
                nixos-clean = "sudo nix-collect-garbage -d; nix-collect-garbage -d";
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
