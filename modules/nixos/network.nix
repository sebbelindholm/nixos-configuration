{
  lib,
  config,
  pkgs,
  ...
}:
{
  networking.networkmanager.enable = true;
  networking.firewall = {
    enable = false;
  };
}
