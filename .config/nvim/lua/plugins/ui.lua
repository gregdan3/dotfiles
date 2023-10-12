return {
	{
		"folke/edgy.nvim",
		opts = { animate = { enabled = false } },
	},

	-- config for filesystem viewer
	{
		"nvim-neo-tree/neo-tree.nvim",
		opts = { filesystem = { filtered_items = { visible = true, hide_dotfiles = false, hide_gitignored = true } } },
	},
}
