{ lib, config, pkgs, ... }:

let
  cfg = config.nvim;
in
{
    imports = [
        ./plugins.nix
    ];

  options.nvim = {
    enable 
      = lib.mkEnableOption "enable nvim module";
  };

  config = lib.mkIf cfg.enable {
    programs = {
        neovim = {
            enable = true;
            viAlias = true;
            vimAlias = true;
        };
    };
    home.file.".config/nvim" = {
        source = ./nvim;
        recursive = true;
    };



  };
}