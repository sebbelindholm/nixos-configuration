local config = require("nvim-treesitter.configs")
		config.setup({
			hightlight = {
				enable = true,
			},
			indent = { enable = true },
			autotag = {
				enable = true,
				enable_close_on_slash = false,
			},
		})