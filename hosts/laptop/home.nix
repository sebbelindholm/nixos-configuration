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
    ../common-home-nix
  ];

  home.file.".config/hypr/device_specific.conf" = {
    source = ./device_specific.conf;
  };

  home.packages = [
    #SOME HOME PACKAGES SPECIFIC TO THIS MACHINE
  ];

  home.sessionVariables = {
    #SESSIONVARIABLES SPECIFIC TO THIS MACHINE
  };

  home.stateVersion = "24.05";

}
