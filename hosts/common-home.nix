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

  home-packages.enable = true;
  zsh.enable = true;
  git.enable = true;
  gnome.enable = true;
  nvim.enable = true;
  kitty.enable = true;
  google-chrome.enable = true;
  gtk_module.enable = true;
  starship.enable = true;
  hypr.enable = true;
  qt.enable = true;
  wayland.enable = true;
  colors.enable = true;
  niri.enable = true;

  programs.home-manager.enable = true;
}
