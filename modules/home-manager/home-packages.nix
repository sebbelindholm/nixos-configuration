{
  lib,
  config,
  pkgs,
  ...
}:
{
  home.packages = with pkgs; [
    prusa-slicer
    freecad-wayland
    wine
    winetricks
    bottles
    logisim-evolution
    octaveFull
    ghostty
    vscode.fhs
    prismlauncher
    unityhub
    kitty
    vesktop
    lazygit
    neofetch
    bitwarden-desktop
    spotify
    gnome-tweaks
    lutris
  ];

}
