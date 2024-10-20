{
  config,
  pkgs,
  inputs,
  self,
  ...
}:

{
  home.username = "sebastian";
  home.homeDirectory = "/home/sebastian";

  imports = [
    ../../modules/home-manager
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

  home.file.".config/hypr/device_specific.conf" = {
    source = ./device_specific.conf;
  };

  home.packages = [
    #SOME HOME PACKAGES SPECIFIC TO THIS MACHINE
  ];

  home.sessionVariables = {
    #SESSIONVARIABLES SPECIFIC TO THIS MACHINE
  };

  programs.home-manager.enable = true;

  home.stateVersion = "24.05";

}
