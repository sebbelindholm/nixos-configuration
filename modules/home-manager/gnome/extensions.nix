{
  lib,
  config,
  pkgs,
  ...
}:

{
  home.packages = with pkgs.gnomeExtensions; [
    blur-my-shell
    dash-to-panel
    caffeine
    arcmenu
    just-perfection
    launch-new-instance
    native-window-placement
    tray-icons-reloaded
    impatience
    gnome-40-ui-improvements
    tiling-shell
    hibernate-status-button
    prime-helper
  ];
}
