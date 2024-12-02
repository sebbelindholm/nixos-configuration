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

  amdgpu.enable = true;
  rgb.enable = true;

  virtualisation.virtualbox.host.enable = true;
  environment.systemPackages = with pkgs; [
    #SOME PROGRAM SPECIFIC TO THIS MACHINE
  ];

  system.stateVersion = "24.05";

}
