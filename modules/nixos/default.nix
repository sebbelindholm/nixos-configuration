{
  config,
  pkgs,
  inputs,
  ...
}:

{
  imports = [
    ./sys-packages.nix
    ./vm.nix
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
    ./amdgpu.nix
    ./nvidia.nix
    ./igpu-intel.nix
    ./steam.nix
    ./laptop.nix
    ./rgb.nix
    ./udev.nix
    ./services.nix
  ];
}
