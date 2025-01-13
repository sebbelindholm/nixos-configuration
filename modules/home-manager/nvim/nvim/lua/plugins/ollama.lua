require("llama-copilot").setup({
	host = "localhost",
	port = "11434",
	model = "codellama:b7-code",
	max_completion_size = 15, -- use -1 for limitless
	debug = false,
})
