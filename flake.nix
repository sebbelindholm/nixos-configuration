{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland.url = "github:hyprwm/Hyprland";

    nix-colors.url = "github:misterio77/nix-colors";

    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };

    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";

    nixos-hardware.url = "github:NixOS/nixos-hardware";

    razerdaemon.url = "github:sebbelindholm/razer-laptop-control/dev-nix";

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
