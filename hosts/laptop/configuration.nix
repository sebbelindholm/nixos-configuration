{
  config,
  pkgs,
  inputs,
  self,
  ...
}:

{
  nixpkgs.config.allowUnfree = true;

  networking.hostName = "nixos-laptop";
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  imports = [
    ./hardware-configuration.nix
    ../../modules/nixos

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

  services.fstrim = {
    enable = true;
    interval = "weekly";
  };

  sys-packages.enable = true;
  std-sound.enable = true;
  xserver-module.enable = true;
  locale.enable = true;
  ssh.enable = false;
  network.enable = true;
  boot.enable = true;
  font.enable = true;
  std-nix.enable = true;
  bluetooth.enable = true;
  laptop.enable = true;
  nvidia.enable = true;
  igpu-intel.enable = true;
  steam.enable = true;

  services.razer-laptop-control.enable = true;
  services.udev.extraRules = ''
    KERNEL=="hidraw*", SUBSYSTEM=="hidraw", MODE="0660", GROUP="plugdev"
  ''; # needed for correct permissions for razer-laptop-control

  main-user = {
    enable = true;
    userName = "sebastian";
  };

  users.users."sebastian" = {
    extraGroups = [ "openrazer" ];
  };

  environment.systemPackages = with pkgs; [
    openrazer-daemon
    polychromatic
  ];

  system.stateVersion = "24.05";

}
