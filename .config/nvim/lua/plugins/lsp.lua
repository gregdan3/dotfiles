return {
	-- {
	-- 	"nvimtools/none-ls.nvim",
	-- 	event = { "BufReadPre", "BufNewFile" },
	-- 	dependencies = { "mason.nvim" },
	-- 	opts = function()
	-- 		local nls = require("null-ls")
	-- 		return {
	-- 			sources = {
	-- 				nls.builtins.formatting.prettier.with({
	-- 					extra_filetypes = { "svelte", "astro", "mdx", "svx", "edgeql", "esdl" },
	-- 				}),
	-- 				nls.builtins.formatting.trim_newlines,
	-- 				nls.builtins.formatting.trim_whitespace,
	-- 			},
	-- 		}
	-- 	end,
	-- },
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
					"beautysh",
					"gofmt",
					"goimports",
					"golangci_lint",
					"gopls",
					"isort",
					"prettier",
					"python-black",
					"rubocop",
					"rustfmt",
					"shellharden",
					"sql_formatter",
					"staticcheck",
					"stylua",
					"taplo",
					"yamlfmt",
					"proselint",
				},
				handlers = {},
			})
		end,
	},
}
