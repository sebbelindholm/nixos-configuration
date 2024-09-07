{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixos-hardware.url = "github:NixOS/nixos-hardware";

    razerdaemon.url = "github:mardukpill/razer-laptop-control-no-dkms";

  };

  outputs =
    { self, nixpkgs, ... }@inputs:
    {

      nixosConfigurations = {
        nixos-desktop = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit inputs;
          };
          modules = [
            ./hosts/desktop/configuration.nix
          ];
        };

        nixos-laptop = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit inputs;
          };
          modules = [
            ./hosts/laptop/configuration.nix
            #            nixos-hardware.nixosModules.common-gpu-intel
            #nixos-hardware.nixosModules.common-cpu-intel
            #nixos-hardware.nixowModules.common-cpu-
          ];
        };
      };
    };
}
