{
  lib,
  config,
  pkgs,
  ...
}:

let
  cfg = config.bluetooth;
in
{
  options.bluetooth = {
    enable = lib.mkEnableOption "enable bluetooth module";
  };

  config = lib.mkIf cfg.enable {
    hardware = {
      bluetooth = {
        enable = true;
        powerOnBoot = true;
      };
    };

    services = {
      blueman = {
        enable = false;
      };
    };
  };
}

