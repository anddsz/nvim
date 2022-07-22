require('nvim-treesitter.configs').setup({
	ensure_installed = { "c", "cpp", "rust" },
	highlight = {
		enable = true,
	},
	autopairs = {
		enable = true,
	},
	indent = { enable = true },
})
