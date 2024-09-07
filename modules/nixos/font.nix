{
  lib,
  config,
  pkgs,
  ...
}:

let
  cfg = config.font;
in
{
  options.font = {
    enable = lib.mkEnableOption "enable font module";
  };

  config = lib.mkIf cfg.enable {
    fonts.packages = with pkgs; [ (nerdfonts.override { fonts = [ "JetBrainsMono" ]; }) ];
  };
}

