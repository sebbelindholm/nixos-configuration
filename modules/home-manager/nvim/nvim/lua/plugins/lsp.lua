local lsp_zero = require("lsp-zero")

local lsp_attach = function(client, bufnr)
	local opts = { buffer = bufnr }

	vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
	vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
	vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
	vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
	vim.keymap.set("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>", opts)
	vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", opts)
	vim.keymap.set("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)
	vim.keymap.set("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
	vim.keymap.set({ "n", "x" }, "<leader>mf", "<cmd>lua vim.lsp.buf.format({async = true})<cr>", opts)
	vim.keymap.set("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
end

lsp_zero.extend_lspconfig({
	sign_text = true,
	lsp_attach = lsp_attach,
	capabilities = require("cmp_nvim_lsp").default_capabilities(),
})

local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

lspconfig.pyright.setup({ capabilities = capabilities })
lspconfig.nixd.setup({ capabilities = capabilities })
lspconfig.rust_analyzer.setup({ capabilities = capabilities })
lspconfig.lua_ls.setup({
	settings = {
		Lua = {
			diagnostics = { globals = { "vim" } },
		},
	},
	capabilities = capabilities,
})
lspconfig.clangd.setup({ capabilities = capabilities })
