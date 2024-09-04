{ lib, config, pkgs, ... }:

let
  cfg = config.steam;
in
{
  options.steam= {
    enable 
      = lib.mkEnableOption "enable steam module";
  };

  config = lib.mkIf cfg.enable {
       programs.steam = {
            enable = true;
            remotePlay.openFirewall = true;
            dedicatedServer.openFirewall = true;
            localNetworkGameTransfers.openFirewall = true;
        };
  };
}
