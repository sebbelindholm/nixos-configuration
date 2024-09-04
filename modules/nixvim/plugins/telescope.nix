{ lib, config, pkgs, ... }:

{
    programs = {
        nixvim = {
            plugins = {
                telescope = {
                    enable = true;
                    keymaps = {
                        "<leader>ff" = "find_files";
                        "<leader>fb" = "buffers";
                        "<leader>fg" = "live_grep";
                        "<leader>fh" = "oldfiles";
                    };
                    extensions = {
                        fzf-native.enable = true;
                        ui-select.enable = true;
                    };
                };
            };
            extraConfigLua = ''
                require('telescope').setup({
                    pickers = {
					    find_files = {
						    hidden = true,
					    },
				    },
                    defaults = {
					    vimgrep_arguments = {
						    "rg",
						    "--no-heading",
						    "--with-filename",
						    "--line-number",
						    "--column",
						    "--smart-case",
						    "--hidden",
					    },
				    },
                })
            '';
        };
    };
}