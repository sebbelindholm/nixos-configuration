{
  lib,
  config,
  pkgs,
  inputs,
  ...
}:
{
  imports = [
    ./plugins.nix
  ];

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
}
