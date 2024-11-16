{
  lib,
  config,
  pkgs,
  ...
}:

let
  cfg = config.vm-host;
in
{
  options.vm-host = {
    enable = lib.mkEnableOption "enable vm host module";
  };

  config = lib.mkIf cfg.enable {
    virtualisation.virtualbox.host = {
      enable = true;
      enableExtensionPack = true;
    };
    users.extraGroups.vboxusers.members = [ "sebastian" ];
    nixpkgs.config.allowUnfree = true;
  };
}
