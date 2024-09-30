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
      theme = {
        package = pkgs.adw-gtk3;
        name = "adw-gtk3-dark";
      };
      gtk3.extraConfig = {
        Settings = ''
          gtk-application-prefer-dark-theme=1
        '';
      };

      gtk4.extraConfig = {
        Settings = ''
          gtk-application-prefer-dark-theme=1
        '';
      };
    };
    home.sessionVariables.GTK_THEME = "adw-gtk-dark";
  };

}
