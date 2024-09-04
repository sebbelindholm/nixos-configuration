			require("telescope").setup({
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
				extensions = {
					resession = {
						prompt_title = "Find Sessions",
						dir = "session",
						path_substitutions = {
							{ find = "/home/sebastian", replace = " 󱂵 " },
						},
					},
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})

			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Search live grep" })
			vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Buffers" })
			vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Search files" })
			vim.keymap.set("n", "<leader>fh", builtin.oldfiles, { desc = "Recent files" })
			vim.keymap.set("n", "<leader>ft", builtin.colorscheme, { desc = "Select theme" })
			vim.keymap.set(
				"n",
				"<leader><leader>",
				":Telescope file_browser<CR>",
				{ silent = true, desc = "Ivy file browser" }
			)
			vim.keymap.set(
				"n",
				"<leader>fm",
				":Telescope bookmarks list<CR>",
				{ silent = true, desc = "Bookmarks list" }
			)
			require("telescope").load_extension("ui-select")
			require("telescope").load_extension("fzf")
