{
  config,
  pkgs,
  inputs,
  self,
  ...
}:

{
  nixpkgs.config.allowUnfree = true;

  networking.hostName = "nixos-desktop";
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

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

  services.fstrim = {
    enable = true;
    interval = "weekly";
  };

  sys-packages.enable = true;
  amdgpu.enable = true;
  std-sound.enable = true;
  xserver-module.enable = true;
  locale.enable = true;
  ssh.enable = false;
  network.enable = true;
  boot.enable = true;
  font.enable = true;
  std-nix.enable = true;
  bluetooth.enable = true;
  steam.enable = true;

  main-user = {
    enable = true;
    userName = "sebastian";
  };

  environment.systemPackages = with pkgs; [
    #SOME PROGRAM SPECIFIC TO THIS MACHINE
  ];

  system.stateVersion = "24.05";

}
