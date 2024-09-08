{
  lib,
  config,
  pkgs,
  ...
}:

let
  std-sound = config.std-sound;
in
{
  options.std-sound = {
    enable = lib.mkEnableOption "enable standard sound module";
  };

  config = lib.mkIf std-sound.enable {
    hardware.pulseaudio.enable = lib.mkForce false;
    security.rtkit.enable = true;
    services.pipewire = {
      enable = lib.mkForce true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;
    };
  };
}
