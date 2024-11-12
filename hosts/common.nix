{
  config,
  pkgs,
  inputs,
  self,
  ...
}:

{
  imports = [
    ../modules/nixos
  ];

  nixpkgs.config.allowUnfree = true;

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  services.fstrim = {
    enable = true;
    interval = "weekly";
  };

  main-user = {
    enable = true;
    userName = "sebastian";
  };

  sys-packages.enable = true;
  std-sound.enable = true;
  xserver-module.enable = true;
  locale.enable = true;
  ssh.enable = true;
  network.enable = true;
  boot.enable = true;
  font.enable = true;
  std-nix.enable = true;
  bluetooth.enable = true;
  steam.enable = true;
  services.enable = true;
  vars.enable = true;
  udev.enable = true;

}
