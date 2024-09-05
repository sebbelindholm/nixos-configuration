{ config, pkgs, inputs, ... }:

{
  imports = [                              
    ./home-packages.nix
        ./terminal/kitty.nix
    ./terminal/git.nix
    ./terminal/zsh.nix
    ./gnome
    ./nvim
  ];
}
