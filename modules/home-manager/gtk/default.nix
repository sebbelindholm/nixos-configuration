{
  lib,
  config,
  pkgs,
  ...
}:

let
  cfg = config.gtk_module;
in
{
  imports =
    [
    ];

  options.gtk_module = {
    enable = lib.mkEnableOption "enable gtk module";
  };

  config = lib.mkIf cfg.enable {
    gtk = {
      enable = true;
      cursorTheme = {
        name = "Bibata-Modern-Ice";
        package = pkgs.bibata-cursors;
      };
    };
  };
}
