{
  lib,
  config,
  pkgs,
  ...
}:

let
  cfg = config.ssh;
in
{
  options.ssh = {
    enable = lib.mkEnableOption "enable ssh module";
  };

  config = lib.mkIf cfg.enable {
    services.openssh = {
      enable = true;
      settings = {
        PasswordAuthentication = false;
        KbdInteractiveAuthentication = false;
      };
    };
    users.users.sebastian.openssh.authorizedKeys.keys =
      [
      ];
  };
}
