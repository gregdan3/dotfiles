return {
	-- { import = "lazyvim.plugins.extras.ui.mini-starter" },
	{ "nvim-neo-tree/neo-tree.nvim", enabled = false },
	{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	-- { "folke/which-key.nvim", opts = { mappings = {} } },
	{
		"nvim-treesitter/nvim-treesitter",
		auto_install = true,
		opts = {
			ensure_installed = {
				"bash",
				"help",
				"html",
				"javascript",
				"json",
				"lua",
				"markdown",
				"markdown_inline",
				"python",
				"query",
				"regex",
				"rust",
				"tsx",
				"typescript",
				"vim",
				"yaml",
			},
		},
	},
	{
		"jose-elias-alvarez/null-ls.nvim",
		event = "BufReadPre",
		dependencies = { "mason.nvim" },
		opts = function()
			local nls = require("null-ls")
			return {
				sources = {
					nls.builtins.formatting.beautysh,
					nls.builtins.formatting.prettier,
					nls.builtins.formatting.rubocop,
					nls.builtins.formatting.rustfmt,
					nls.builtins.formatting.shellharden,
					nls.builtins.formatting.sql_formatter,
					nls.builtins.formatting.stylua,
					nls.builtins.formatting.taplo,
					nls.builtins.formatting.yamlfmt,
					nls.builtins.formatting.black,
					nls.builtins.formatting.isort,
					nls.builtins.hover.printenv,
					nls.builtins.hover.dictionary,

					nls.builtins.formatting.trim_newlines,
					nls.builtins.formatting.trim_whitespace,
				},
			}
		end,
	},

	-- {
	--   "jayp0521/mason-null-ls.nvim",
	--   event = "BufReadPre",
	--   dependencies = { "williamboman/mason.nvim", "jose-elias-alvarez/null-ls.nvim" },
	--   config = {
	--     function()
	--       require("mason-null-ls").setup({
	--         automatic_setup = true,
	--         automatic_installation = true,
	--       })
	--       require("mason-null-ls").setup_handlers({})
	--     end,
	--   },
	-- },
	{
		"akinsho/toggleterm.nvim",
		event = "VeryLazy",
		opts = {
			open_mapping = "<c-t>",
			direction = "float",

			execs = {
				{ nil, "<M-1>", "Horizontal Terminal", "horizontal", 0.3 },
				{ nil, "<M-2>", "Vertical Terminal", "vertical", 0.4 },
				{ nil, "<M-3>", "Float Terminal", "float", nil },
			},
		},
	},
	{ "RRethy/vim-illuminate" }, -- highlight same symbol elsewhere
	{ "romgrk/nvim-treesitter-context", event = "VeryLazy", opts = { enable = true } }, -- show current function
	{ "mfussenegger/nvim-dap" },
	{ "rcarriga/nvim-dap-ui" },
}
