{
  lib,
  config,
  pkgs,
  ...
}:

let
  cfg = config.ags;
in
{
  options.ags = {
    enable = lib.mkEnableOption "enable ags module";
  };

  config = lib.mkIf cfg.enable {
    programs.ags = {
      enable = true;
      configDir = ./ags;
      extraPackages = with pkgs; [
        accountsservice
      ];
    };
  };
}
