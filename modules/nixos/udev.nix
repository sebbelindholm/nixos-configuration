{
  lib,
  config,
  pkgs,
  ...
}:
{
  services.udev.packages = with pkgs; [
    via
  ];
}
