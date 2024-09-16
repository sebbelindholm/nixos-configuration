require("auto-session").setup({
	suppressed_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
	session_lens = {
		previewer = true,
	},
	bypass_save_filetypes = { "dashboard" },
})

vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

vim.keymap.set("n", "<leader>ss", "<CMD>SessionSave<CR>", { desc = "Save session" })
vim.keymap.set("n", "<leader>sl", "<CMD>SessionSearch<CR>", { desc = "Search for session" })
vim.keymap.set("n", "<leader>sd", "<CMD>SessionDelete<CR>", { desc = "Delete session" })
