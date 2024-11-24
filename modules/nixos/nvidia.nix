{
  lib,
  config,
  pkgs,
  ...
}:

let
  cfg = config.nvidia;
in
{
  options.nvidia = {
    enable = lib.mkEnableOption "enable nvidia module";
  };

  config = lib.mkIf cfg.enable {
    hardware.graphics = {
      enable = true;
    };

    services.xserver.videoDrivers = [ "nvidia" ];

    hardware.graphics.enable32Bit = true;

    hardware.nvidia = {
      modesetting.enable = true;
      powerManagement = {
        enable = false;
        finegrained = false;
      };
      open = false;
      nvidiaSettings = true;

      package = config.boot.kernelPackages.nvidiaPackages.production;

      prime = {
        intelBusId = "PCI:00:02:0";
        nvidiaBusId = "PCI:1:00:0";
        offload = {
          enable = true;
          enableOffloadCmd = true;
        };
      };
    };
  };
}
