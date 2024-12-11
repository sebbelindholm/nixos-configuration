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
    ../../modules/nixos/nvidia.nix
    ../../modules/nixos/igpu-intel.nix
    ../../modules/nixos/laptop.nix

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

  services.razer-laptop-control.enable = true;

  users.users."sebastian" = {
    extraGroups = [ "openrazer" ];
  };

  environment.systemPackages = with pkgs; [
    openrazer-daemon
    polychromatic
  ];

  system.stateVersion = "24.05";

}
