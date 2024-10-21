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
					"editorconfig-checker",

					"basedpyright",
					"docformatter",
					"ruff-lsp",
					"black",
					"isort",

					"eslint-lsp",
					"typescript-language-server",
					-- "tsserver",
					"svelte-language-server",
					-- "prettier",

					"css-lsp",
					-- "tailwindcss-language-server",

					"docker-compose-language-service",
					"dockerfile-language-server",
					"hadolint",
					"trivy",

					"sql-formatter",
					-- "sqlls",

					-- "bash-language-server",
					-- "shellharden",
					-- "shfmt",

					"stylua",
					"lua-language-server",

					-- "ansible-language-server",
					-- "ansible-lint",

					"yaml-language-server",
					"yamllint",
					"actionlint",
					-- "taplo-lsp",
					-- "jsonls",

					-- "terraform-ls",
					-- "tflint",
					-- "tfsec",

					-- "rust-analyzer",

					-- "gofmt",
					-- "goimports",
					-- "golangci_lint",
					-- "gopls",
					-- "delve",
					-- "staticcheck",
				},
				handlers = {},
			})
		end,
	},
}
