{
  lib,
  config,
  pkgs,
  ...
}:

let
  cfg = config.network;
in
{
  options.network = {
    enable = lib.mkEnableOption "enable network module";
  };

  config = lib.mkIf cfg.enable {
    networking.networkmanager.enable = true;
  };
}

