{
  lib,
  config,
  pkgs,
  ...
}:

let
  cfg = config.wayland;
in
{
  imports = [
    ../browser
  ];

  options.wayland = {
    enable = lib.mkEnableOption "enable wayland module";
  };

  config = lib.mkIf cfg.enable {
    google-chrome.enable = true;
    programs.chromium = {
      commandLineArgs = [
        "--enable-features=UseOzonePlatform"
        "--ozone-platform=wayland"
        "--ignore-gpu-blocklist"
        "--enable-zero-copy"
        "--enable-features=VaapiVideoDecodeLinuxGL"
        "--enable-features=TouchpadOverscrollHistoryNavigation"
      ];
    };
  };
}
