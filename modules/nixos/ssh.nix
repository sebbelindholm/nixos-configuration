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
    users.users.sebastian.openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIO57I6zrUaKV7/WvVhdNjO9Dyabd0BDyp1n4hWXg9cw sebastian@nixos"
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINPJwWddmvo2Ogi4LT6fQ8NHo0JuAJj59URC8OJTrUWR sebastian@nixos-desktop"
    ];
  };
}
