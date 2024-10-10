{
  lib,
  config,
  pkgs,
  ...
}:

let
  cfg = config.cosmic;
in
{
  imports =
    [
    ];

  options.cosmic = {
    enable = lib.mkEnableOption "enable cosmic module";
  };

  config = lib.mkIf cfg.enable {
    home.file.".config/cosmic".source = config.lib.file.mkOutOfStoreSymlink /home/sebastian/.setup/modules/home-manager/cosmic/cosmic;
  };
}
