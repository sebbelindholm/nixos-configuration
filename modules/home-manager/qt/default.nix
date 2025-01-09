{
  lib,
  config,
  pkgs,
  ...
}:
{
  imports = [
  ];
  qt = {
    enable = true;
    platformTheme.name = "gtk";
    style = {
      package = pkgs.adwaita-qt;
      name = "adwaita-dark";
    };
  };
}
