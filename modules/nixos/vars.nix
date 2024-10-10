{
  lib,
  config,
  pkgs,
  ...
}:

let
  cfg = config.vars;
in
{
  options.vars = {
    enable = lib.mkEnableOption "enable vars module";
  };

  config = lib.mkIf cfg.enable {
    environment.sessionVariables = {
      XCURSOR_SIZE = "24";
    };
  };
}
