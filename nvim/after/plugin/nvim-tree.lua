require("nvim-tree").setup({
	disable_netrw = true,
	hijack_netrw = true,
	update_focused_file = { enable = true },
	view = {
		side = "right",
	},

	filters = {
		dotfiles = false,
	},
	git = {
		ignore = false,
	},
})
