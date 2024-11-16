{
  config,
  pkgs,
  inputs,
  self,
  ...
}:

{

  networking.hostName = "nixos-vm";

  imports = [
    ./hardware-configuration.nix
    ../../modules/nixos
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

  boot.enable = true;
  locale.enable = true;
  network.enable = true;
  services.enable = true;
  sound.enable = true;
  std-nix.enable = true;

  main-user = {
    enable = true;
    userName = "vm";
  };

  environment.systemPackages = with pkgs; [
    #SOME PROGRAM SPECIFIC TO THIS MACHINE
  ];

  system.stateVersion = "24.05";

}
