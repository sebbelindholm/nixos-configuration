{
  config,
  pkgs,
  inputs,
  self,
  ...
}:

{
  imports = [
    inputs.nix-colors.homeManagerModules.default
    ../modules/home-manager
  ];

  programs.home-manager.enable = true;
}
