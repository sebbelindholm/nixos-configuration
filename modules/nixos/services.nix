{
  lib,
  config,
  pkgs,
  ...
}:
{
  services.udisks2.enable = true;
  hardware.spacenavd.enable = true;
}
