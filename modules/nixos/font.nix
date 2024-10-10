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
    fonts.packages = with pkgs; [
      ubuntu_font_family
      (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
    ];
  };
}
