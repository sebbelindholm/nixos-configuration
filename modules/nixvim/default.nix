{ lib, config, pkgs, ... }:

let
  cfg = config.nixvim;
in
{
    imports = [
    ./plugins
    ./settings.nix
    ./keymaps.nix
    ];

  options.nixvim = {
    enable 
      = lib.mkEnableOption "enable nixvim module";
  };

  config = lib.mkIf cfg.enable {
    programs.nixvim.enable = true;
  };
}