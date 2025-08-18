return {
	{
		"nvim-treesitter/nvim-treesitter",
		auto_install = true,
		opts = {
			ensure_installed = {
				-- langs
				"python",
				"rust",
				"lua",
				"sql",
				"dockerfile",
				--
				"bash",
				"fish",
				--
				"javascript",
				"typescript",
				"svelte",
				"astro",
				"html",
				"css",
				---
				"toml",
				"yaml",
				"json",
				-- inline
				"regex",
				-- writing
				"markdown",
				"markdown_inline",
				"mermaid",
				-- git
				"gitcommit",
				"gitignore",
				"gitattributes",
				"git_rebase",
				"git_config",
			},
		},
	},
	{
		"Saghen/blink.cmp",
		opts = {
			keymap = {
				preset = "super-tab",
				["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
				["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
				["<CR>"] = { "select_and_accept", "fallback" },
				["<S-CR>"] = {},
			},
		},
	},
	{
		"stevearc/conform.nvim",
		opts = {
			formatters_by_ft = {
				lua = { "stylua" },
				fish = { "fish_indent" },
				sh = { "shfmt" },
				bash = { "shfmt" },
				typescript = { "prettier" },
				javascript = { "prettier" },
				python = { "isort", "black" },
			},
		},
	},
}
