return {
	{
		"nvimtools/none-ls.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = { "mason.nvim" },
		opts = function()
			local nls = require("null-ls")
			return {
				sources = {
					nls.builtins.formatting.prettier.with({
						extra_filetypes = { "svelte", "astro", "mdx", "svx", "edgeql", "esdl" },
					}),
					nls.builtins.formatting.trim_newlines,
					nls.builtins.formatting.trim_whitespace,
				},
			}
		end,
	},
	{
		"jay-babu/mason-null-ls.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"williamboman/mason.nvim",
			"nvimtools/none-ls.nvim",
		},
		config = function()
			require("mason-null-ls").setup({
				automatic_installation = true,
				automatic_setup = true,
				ensure_installed = {
					"actionlint",
					"ansiblelint",
					"staticcheck",
					"beautysh",
					"python-black",
					"gofmt",
					"goimports",
					"golangci_lint",
					"gopls",
					"isort",
					"prettier",
					"rubocop",
					"rustfmt",
					"shellharden",
					"sql_formatter",
					"stylua",
					"taplo",
					"yamlfmt",
				},
				handlers = {},
			})
		end,
	},

	{
		"simrat39/symbols-outline.nvim",
		cmd = "SymbolsOutline",
		keys = { { "<leader>cs", "<cmd>SymbolsOutline<cr>", desc = "Symbols Outline" } },
		opts = { position = "left" },
		-- config = true,
	},
}
