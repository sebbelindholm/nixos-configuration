{ lib, config, pkgs, ... }:

let
  cfg = config.igpu-intel;
in
{
  options.igpu-intel = {
    enable 
      = lib.mkEnableOption "enable igpu intel module";
  };

  config = lib.mkIf cfg.enable {
            nixpkgs.config.packageOverrides = pkgs: {
        intel-vaapi-driver = pkgs.intel-vaapi-driver.override { enableHybridCodec = true; };
      };
      hardware.opengl = { # hardware.graphics on unstable
        enable = true;
        extraPackages = with pkgs; [
          intel-media-driver # LIBVA_DRIVER_NAME=iHD
          libvdpau-va-gl
        ];
      };
        hardware.graphics.extraPackages32 = with pkgs.pkgsi686Linux; [ intel-vaapi-driver ];
      environment.sessionVariables = { LIBVA_DRIVER_NAME = "iHD"; }; # Force intel-media-driver
    };
}
