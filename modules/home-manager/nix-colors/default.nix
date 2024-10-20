{
  lib,
  config,
  pkgs,
  inputs,
  ...
}:

let
  cfg = config.colors;
in
{
  imports =
    [
    ];

  options.colors = {
    enable = lib.mkEnableOption "enable colors module";
  };

  config = lib.mkIf cfg.enable {
    colorScheme = inputs.nix-colors.colorSchemes.tokyo-night-dark;
  };
}
