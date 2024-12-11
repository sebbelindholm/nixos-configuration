{
  lib,
  config,
  pkgs,
  ...
}:
{
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
}
