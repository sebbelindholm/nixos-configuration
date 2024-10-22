{
  lib,
  config,
  pkgs,
  inputs,
  ...
}:

let
  cfg = config.nvim;
in
{
  imports = [
    ./plugins.nix
  ];

  options.nvim = {
    enable = lib.mkEnableOption "enable nvim module";
  };

  config = lib.mkIf cfg.enable {
    programs = {
      neovim = {
        enable = true;
        package = inputs.neovim-nightly-overlay.packages.${pkgs.system}.default;
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
