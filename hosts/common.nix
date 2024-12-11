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
}
