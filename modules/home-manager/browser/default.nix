{
  lib,
  config,
  pkgs,
  ...
}:
{
  programs.chromium = {
    enable = true;
    package = pkgs.google-chrome;
  };
}
