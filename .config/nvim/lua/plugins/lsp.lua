return {
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
					-- "gofmt",
					-- "goimports",
					-- "golangci_lint",
					-- "gopls",
					"isort",
					"prettier",
					"proselint",
					"python-black",
					"rubocop",
					"rustfmt",
					"shellharden",
					"sql_formatter",
					"staticcheck",
					"stylua",
					"taplo",
				},
				handlers = {},
			})
		end,
	},
}
