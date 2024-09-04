{ lib, config, pkgs, ... }:

let
  cfg = config.nvidia;
in
{
  options.nvidia= {
    enable 
      = lib.mkEnableOption "enable nvidia module";
  };

  config = lib.mkIf cfg.enable {
    hardware.graphics= {
        enable = true;
    };
    
    services.xserver.videoDrivers = ["nvidia"];

    hardware.nvidia = {
        modesetting.enable = true;
        powerManagement = {
                enable = false;
                finegrained = false;
        };
        open = false;
        nvidiaSettings = true;

        package = config.boot.kernelPackages.nvidiaPackages.latest;

        prime = {
                offload = {
                    enable = true;
                    enableOffloadCmd = true;
                };
            };
    };

  };
}
