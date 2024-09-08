{
  lib,
  config,
  pkgs,
  ...
}:

let
  cfg = config.rgb;
in
{
  options.rgb = {
    enable = lib.mkEnableOption "enable rgb module";
  };

  config = lib.mkIf cfg.enable {
    services.hardware.openrgb.enable = true;
  };
}
