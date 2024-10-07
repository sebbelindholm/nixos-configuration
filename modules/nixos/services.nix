{
  lib,
  config,
  pkgs,
  ...
}:

let
  cfg = config.services;
in
{
  options.services = {
    enable = lib.mkEnableOption "enable services module";
  };

  config = lib.mkIf cfg.enable {
    services.udisks2.enable = true;
  };
}
