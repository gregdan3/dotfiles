return {
	{ import = "lazyvim.plugins.extras.ui.edgy" },
	{ import = "lazyvim.plugins.extras.ui.mini-starter" },
	-- { "echasnovski/mini.cursorword" },
	{ "romgrk/nvim-treesitter-context", event = "VeryLazy", opts = { enable = true } }, -- show head of current func/codeblock
	{
		"nvim-neo-tree/neo-tree.nvim",
		opts = { filesystem = { filtered_items = { visible = true, hide_dotfiles = false, hide_gitignored = true } } },
	},
}
