{
  lib,
  config,
  pkgs,
  ...
}:
{
  home.packages = with pkgs; [
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
