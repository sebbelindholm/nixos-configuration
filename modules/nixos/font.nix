{
  lib,
  config,
  pkgs,
  ...
}:
{
  fonts.packages = with pkgs; [
    ubuntu_font_family
    nerd-fonts.jetbrains-mono
  ];
}
