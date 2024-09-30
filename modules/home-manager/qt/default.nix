{
  lib,
  config,
  pkgs,
  ...
}:

let
  cfg = config.qt_module;
in
{
  imports =
    [
    ];

  options.qt_module = {
    enable = lib.mkEnableOption "enable qt module";
  };

  config = lib.mkIf cfg.enable {
    qt = {
      enable = true;
      platformTheme = "gtk";
      style = {
        package = pkgs.adwaita-qt;
        name = "adwaita-dark";
      };
    };
  };
}
