{ lib, config, pkgs, ... }:

{
    imports = [
        ./simple-plugins.nix
        ./lsp.nix
        ./treesitter.nix
        ./cmp.nix
        ./lsp.nix
        ./telescope.nix
    ];
}