{
  lib,
  config,
  pkgs,
  ...
}:
{
  imports = [
    ../browser
  ];
  programs.chromium = {
    commandLineArgs = [
      "--enable-features=UseOzonePlatform"
      #"--ozone-platform=wayland"
      "--ozone-platform-hint=auto"
      "--ignore-gpu-blocklist"
      "--enable-zero-copy"
      "--enable-features=VaapiVideoDecodeLinuxGL"
      "--enable-features=TouchpadOverscrollHistoryNavigation"
    ];
  };
}
