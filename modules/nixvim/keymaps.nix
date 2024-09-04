{ lib, config, pkgs, ... }:

{
    programs = {
        nixvim = {
            keymaps = [
                {
                    key = "<leader>n";
                    action = "<CMD>Neotree toggle<CR>";
                    options.desc = "Toggle Neo-tree";
                    options.silent = true;
                }
                {
                    mode = "n";
                    key = "<ESC>";
                    action = "<CMD>nohlsearch<CR>";
                }
                {
                    mode = "n";
                    key = "<leader>vv";
                    action = "<CMD>vsplit<CR>";
                    options.desc = "Vertical split";
                    options.silent = true;
                }
                {
                    mode = "n";
                    key = "<leader>vs";
                    action = "<CMD>split<CR>";
                    options.desc = "Horizontal split";
                    options.silent = true;
                }
                {
                    mode = "n";
                    key = "<leader>db";
                    action = "<CMD>bdelete<CR>";
                    options.desc = "Delete buffer";
                    options.silent = true;
                }
                {
                    mode = "n";
                    key = "<leader>dw";
                    action = "<C-w>c";
                    options.desc = "Delete window";
                    options.silent = true;
                }
                {
                    mode = "n";
                    key = "<C-h>";
                    action = "<C-w>h";
                }
                {
                    mode = "n";
                    key = "<C-j>";
                    action = "<C-w>j";
                }
                {
                    mode = "n";
                    key = "<C-k>";
                    action = "<C-w>k";
                }
                {
                    mode = "n";
                    key = "<C-l>";
                    action = "<C-w>l";
                }
            ];
            extraConfigLua = ''
                function _G.set_terminal_keymap()
	                local opts = { noremap = true }
	                vim.api.nvim_buf_set_keymap(0, "t", "<esc>", [[<C-\><C-n>]], opts)
	                vim.api.nvim_buf_set_keymap(0, "t", "jk", [[<C-\><C-n>]], opts)
	                vim.api.nvim_buf_set_keymap(0, "t", "<C-h>", [[<C-\><C-n><C-W>h]], opts)
	                vim.api.nvim_buf_set_keymap(0, "t", "<C-j>", [[<C-\><C-n><C-W>j]], opts)
	                vim.api.nvim_buf_set_keymap(0, "t", "<C-k>", [[<C-\><C-n><C-W>k]], opts)
	                vim.api.nvim_buf_set_keymap(0, "t", "<C-l>", [[<C-\><C-n><C-W>l]], opts)
                end

                vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymap()")
            '';
        };
    };
}