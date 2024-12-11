{
  config,
  pkgs,
  inputs,
  ...
}:

{
  imports = [
    ./sys-packages.nix
    ./main-user.nix
    ./vars.nix
    ./ssh.nix
    ./sound.nix
    ./xserver-module.nix
    ./locale.nix
    ./network.nix
    ./boot.nix
    ./font.nix
    ./std-nix.nix
    ./bluetooth.nix
    ./steam.nix
    ./laptop.nix
    ./rgb.nix
    ./udev.nix
    ./services.nix
  ];
}
