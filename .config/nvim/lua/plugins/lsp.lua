return {
	{
		"jose-elias-alvarez/null-ls.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = { "mason.nvim" },
		opts = function()
			local nls = require("null-ls")
			return {
				sources = {
					nls.builtins.formatting.beautysh,
					nls.builtins.formatting.black,
					nls.builtins.formatting.isort,
					nls.builtins.formatting.prettier.with({
						extra_filetypes = { "svelte", "astro", "mdx", "svx", "edgeql", "esdl" },
					}),
					nls.builtins.formatting.rubocop,
					nls.builtins.formatting.rustfmt,
					nls.builtins.formatting.shellharden,
					nls.builtins.formatting.sql_formatter,
					nls.builtins.formatting.stylua,
					nls.builtins.formatting.taplo,
					nls.builtins.formatting.yamlfmt,
					nls.builtins.hover.dictionary,
					nls.builtins.hover.printenv,
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
			"jose-elias-alvarez/null-ls.nvim",
		},
		config = function()
			require("mason-null-ls").setup({
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
			})
		end,
	},
}
