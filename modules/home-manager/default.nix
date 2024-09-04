{ config, pkgs, inputs, ... }:

{
  imports = [                              
    ./home-packages.nix
    ./terminal/git.nix
    ./terminal/zsh.nix
    ./gnome
    ./nvim
  ];
}