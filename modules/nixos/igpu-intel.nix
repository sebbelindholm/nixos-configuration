{
  lib,
  config,
  pkgs,
  ...
}:

let
  cfg = config.igpu-intel;
in
{
  options.igpu-intel = {
    enable = lib.mkEnableOption "enable igpu intel module";
  };

  config = lib.mkIf cfg.enable {

    #    services.xserver.videoDrivers = [ "intel" ];

    hardware.graphics = {
      enable = true;
      extraPackages = with pkgs; [
        intel-media-driver # LIBVA_DRIVER_NAME=iHD
        intel-vaapi-driver
      ];
    };
    hardware.graphics.extraPackages32 = with pkgs.pkgsi686Linux; [ intel-vaapi-driver ];

    environment.sessionVariables = {
      LIBVA_DRIVER_NAME = "iHD";
    };
  };
}
