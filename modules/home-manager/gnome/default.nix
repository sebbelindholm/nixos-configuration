{
  lib,
  config,
  pkgs,
  ...
}:
{
  imports = [
    ./extensions.nix
  ];
  dconf.enable = true;
  home.packages = with pkgs; [
    #gnome-extension-manager
  ];
}
