return {
	{ import = "lazyvim.plugins.extras.dap.core" },
	{
		"folke/which-key.nvim",
		optional = true,
		opts = {
			defaults = {
				["<leader>d"] = { name = "+debug" },
				["<leader>da"] = { name = "+adapters" },
			},
		},
	},
	{
		"jay-babu/mason-nvim-dap.nvim",
		dependencies = "mason.nvim",
		cmd = { "DapInstall", "DapUninstall" },
		opts = {
			automatic_installation = true,
			handlers = {},
			-- https://github.com/jay-babu/mason-nvim-dap.nvim/blob/main/lua/mason-nvim-dap/mappings/source.lua
			ensure_installed = {
				"python",
				"js",
				"delve",
			},
		},
	},
}
