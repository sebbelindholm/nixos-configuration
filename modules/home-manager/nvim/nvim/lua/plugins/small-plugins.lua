require("nvim-autopairs").setup({ disable_filetype = { "TelescopePrompt", "vim", "neo-tree" } })
require("dashboard").setup({ theme = "hyper" })
require("Comment").setup()
require("dressing").setup({ enabled = true })
require("gitsigns").setup({})
require("which-key").setup({})
require("colorizer").setup({})
require("fidget").setup({})
require("numb").setup({})
require("nvim-surround").setup({})
require("ibl").setup({
	indent = { char = "▏" },
	scope = {
		enabled = true,
		show_start = false,
		include = {
			node_type = {
				lua = { "return_statement", "table_constructor" },
				["*"] = { "object", "arguments", "named_imports", "class_body" },
			},
		},
	},
	exclude = {
		filetypes = { "dashboard" },
	},
})
