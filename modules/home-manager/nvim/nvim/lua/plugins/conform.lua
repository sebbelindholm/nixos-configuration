require("conform").setup({
	format = {
		timeout_ms = 3000,
		async = false,
		quiet = false,
	},
	formatters_by_ft = {
		["markdown.mdx"] = { "prettierd" },
		bash = { "shfmt" },
		css = { "prettierd" },
		fish = { "fish_indent" },
		go = { "goimports", "gofumpt" },
		graphql = { "prettierd" },
		html = { "prettierd" },
		javascript = { "prettierd" },
		javascriptreact = { "prettierd" },
		json = { "prettierd" },
		jsonc = { "prettierd" },
		less = { "prettierd" },
		lua = { "stylua" },
		markdown = { "prettierd" },
		sass = { "prettierd" },
		scss = { "prettierd" },
		sh = { "shfmt" },
		typescript = { "prettierd" },
		typescriptreact = { "prettierd" },
		vue = { "prettierd" },
		yaml = { "prettierd" },
		zsh = { "shfmt" },
		rust = { "rustfmt" },
		python = { "isort", "black" },
		c = { "clangd" },
		nix = { "nixfmt" },
	},
	formatters = {
		injected = { options = { ignore_errors = true } },
	},
	format_on_save = {
		timeout_ms = 500,
		lsp_fallback = true,
	},
	format_after_save = {
		lsp_fallback = true,
	},
})
