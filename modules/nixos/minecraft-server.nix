{
  lib,
  config,
  pkgs,
  ...
}:
{
  services.minecraft-server = {
    enable = true;
    eula = true;
    package = pkgs.papermcServers.papermc-1_21_4;
    #dataDir = "/home/sebastian/Projects/mc-server";
  };
}
