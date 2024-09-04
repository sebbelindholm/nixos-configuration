{ lib, config, pkgs, ... }:

{
    programs = {
        nixvim = {

            plugins.trouble.enable = true;

            plugins.none-ls = {
                enable = true;
                sources = {
                    diagnostics = {
                        
                    };
                    formatting = {
                        nixfmt.enable = true;
                        markdownlint.enable = true;
                        shellharden.enable = true;
                    };
                };
            };

            plugins = {
                lsp = {
                    enable = true;
                    servers = {
                        bashls.enable = true;
                        clangd.enable = true;
                        nixd.enable = true;
                    };
                    keymaps.lspBuf = {
                        "gd" = "definition";
                        "gD" = "references";
                        "gt" = "type_definition";
                        "gi" = "implementation";
                        "K" = "hover";
                    };
                };
                rust-tools.enable = true;
            };

        };
    };
}