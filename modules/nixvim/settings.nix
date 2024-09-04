{ lib, config, pkgs, ... }:

{
    programs = {
        nixvim = {
            colorschemes.onedark.enable = true;
            globals.mapleader = " ";
            opts = {
                expandtab = true;
                tabstop = 4;
                softtabstop = 4;
                number = true;
                relativenumber = true;
                signcolumn = "number";
                termguicolors = true;
                laststatus = 3;
                sessionoptions = "curdir,folds,globals,tabpages,terminal,winsize";
                fillchars = "eob: ,fold: ,foldopen:,foldsep:|,foldclose:";
                undofile = true;
                ignorecase = true;
                smartcase = true;
                splitright = true;
                splitbelow = true;
                scrolloff = 10;
                conceallevel = 3;
                shiftwidth = 4;
            };
        };
    };    
}
