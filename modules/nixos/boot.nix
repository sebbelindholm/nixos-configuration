{
  lib,
  config,
  pkgs,
  ...
}:

let
  cfg = config.boot;
in
{
  options.boot = {
    enable = lib.mkEnableOption "enable boot module";
  };

  config = lib.mkIf cfg.enable {
    boot.kernelPackages = pkgs.linuxPackages_latest;
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;
  };
}

