{
  lib,
  config,
  pkgs,
  ...
}:
{
  home.file = {
    ".config/ghostty/config" = {
      source = ./ghostty.conf;
    };
  };
}
