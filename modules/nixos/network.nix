{
  lib,
  config,
  pkgs,
  ...
}:
{
  networking.networkmanager.enable = true;
  networking.networkmanager.unmanaged = [ "interface-name:ve-*" ];
  networking.firewall = {
    enable = false;
  };
}
