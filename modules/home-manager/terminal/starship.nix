{
  lib,
  config,
  pkgs,
  ...
}:

let
  cfg = config.starship;
in
{
  options.starship = {
    enable = lib.mkEnableOption "enable starship module";
  };

  config = lib.mkIf cfg.enable {
    programs = {
      starship = {
        enable = true;
      };
    };
    home.file = {
      ".config/starship.toml" = {
        source = ./starship.toml;
      };
    };
  };
}
