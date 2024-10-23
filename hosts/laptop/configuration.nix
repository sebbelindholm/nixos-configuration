{
  config,
  pkgs,
  inputs,
  self,
  ...
}:

{

  networking.hostName = "nixos-laptop";

  imports = [
    ./hardware-configuration.nix
    ../../modules/nixos
    ../common.nix

    inputs.razerdaemon.nixosModules.default
    inputs.home-manager.nixosModules.default
    {
      home-manager.useGlobalPkgs = true;
      home-manager.useUserPackages = true;
      home-manager.users.sebastian = import ./home.nix;
      home-manager.extraSpecialArgs = {
        inherit inputs;
      };
    }
  ];

  laptop.enable = true;
  nvidia.enable = true;
  igpu-intel.enable = true;

  services.razer-laptop-control.enable = true;
  services.udev.extraRules = ''
    KERNEL=="hidraw*", SUBSYSTEM=="hidraw", MODE="0660", GROUP="plugdev"
  ''; # needed for correct permissions for razer-laptop-control

  users.users."sebastian" = {
    extraGroups = [ "openrazer" ];
  };

  environment.systemPackages = with pkgs; [
    openrazer-daemon
    polychromatic
  ];

  system.stateVersion = "24.05";

}
