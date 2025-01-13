{
  config,
  pkgs,
  inputs,
  self,
  ...
}:

{
  networking.hostName = "nixos-desktop";

  imports = [
    ./hardware-configuration.nix
    ../../modules/nixos/amdgpu.nix
    ../../modules/nixos/ai.nix
    ../../modules/nixos
    ../common.nix
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

  environment.systemPackages = with pkgs; [
    #SOME PROGRAM SPECIFIC TO THIS MACHINE
  ];

  system.stateVersion = "24.05";

}
