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
    ../common-home.nix
  ];

  home.file.".config/hypr/device_specific.conf" = {
    source = ./device_specific.conf;
  };

  home.packages =
    with pkgs;
    [
    ];

  home.sessionVariables = {
    #SESSIONVARIABLES SPECIFIC TO THIS MACHINE
  };

  programs.home-manager.enable = true;

  home.stateVersion = "24.05";

}
