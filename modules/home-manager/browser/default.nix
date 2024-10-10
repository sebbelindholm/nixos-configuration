{
  lib,
  config,
  pkgs,
  ...
}:

let
  cfg = config.google-chrome;
in
{
  options.google-chrome = {
    enable = lib.mkEnableOption "enable google chrome module";
  };

  config = lib.mkIf cfg.enable {
    programs.chromium = {
      enable = true;
      package = pkgs.google-chrome;
    };
  };
}
