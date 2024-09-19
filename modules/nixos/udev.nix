{
  lib,
  config,
  pkgs,
  ...
}:

let
  cfg = config.udev;
in
{
  options.udev = {
    enable = lib.mkEnableOption "enable udev module";
  };

  config = lib.mkIf cfg.enable {
    services.udev.packages = with pkgs; [
      via
    ];
  };
}
