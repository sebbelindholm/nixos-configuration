require("kanagawa").setup({
	transparent = true, -- do not set background color
	terminalColors = true, -- define vim.g.terminal_color_{0,17}
})

require("onedark").setup({
	style = "warmer",
})

---vim.o.background = "dark"
---vim.cmd([[colorscheme onedark]])
vim.cmd([[colorscheme vscode]])
vim.cmd("hi LineNr guibg=NONE")
vim.cmd("hi FoldColumn guibg=NONE")
vim.cmd("hi SignColumn guibg=NONE")
