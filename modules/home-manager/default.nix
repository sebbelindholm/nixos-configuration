{
  config,
  pkgs,
  inputs,
  ...
}:

{
  imports = [
    ./home-packages.nix
    ./terminal/kitty.nix
    ./terminal/git.nix
    ./terminal/zsh.nix
    ./terminal/starship.nix
    ./gnome
    ./nvim
    ./browser
    ./gtk
    ./hypr
    ./qt
    ./wayland
    ./nix-colors
  ];
}
