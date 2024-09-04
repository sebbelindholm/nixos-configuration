{ lib, config, pkgs, ... }:

{
    programs = {
        nixvim = {
            plugins = {
                conform = {
                    
                };
            };
        };
    };
}
