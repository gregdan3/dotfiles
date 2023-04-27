local logic = require("mason-core.functional.logic")
return {
	{ import = "lazyvim.plugins.extras.ui.mini-starter" },
	-- { "nvim-neo-tree/neo-tree.nvim", enabled = false },
	{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	-- { "folke/which-key.nvim", opts = { mappings = {} } },
	{
		"nvim-treesitter/nvim-treesitter",
		auto_install = true,
		opts = {
			ensure_installed = {
				"astro",
				"bash",
				"go",
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
				"svelte",
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
					nls.builtins.formatting.prettier.with({ extra_filetypes = { "svelte", "astro", "mdx", "svx" } }),
					nls.builtins.hover.printenv,
					nls.builtins.hover.dictionary,
					-- nls.builtins.formatting.fixjson,
					--
					-- nls.builtins.diagnostics.alex,
					-- nls.builtins.diagnostics.writegood,
					-- nls.builtins.diagnostics.spell,

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
					"black",
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
	{
		"L3MON4D3/LuaSnip",
		keys = function()
			return {}
		end,
	},
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-emoji",
		},
		---@param opts cmp.ConfigSchema
		opts = function(_, opts)
			local has_words_before = function()
				unpack = unpack or table.unpack
				local line, col = unpack(vim.api.nvim_win_get_cursor(0))
				return col ~= 0
					and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
			end

			local luasnip = require("luasnip")
			local cmp = require("cmp")

			opts.mapping = vim.tbl_extend("force", opts.mapping, {
				["<Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_next_item()
					elseif luasnip.expand_or_locally_jumpable() then
						luasnip.expand_or_jump()
					elseif has_words_before() then
						cmp.complete()
					else
						fallback()
					end
				end, { "i", "s" }),
				["<S-Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_prev_item()
					elseif luasnip.jumpable(-1) then
						luasnip.jump(-1)
					else
						fallback()
					end
				end, { "i", "s" }),
			})
		end,
	},
	{
		"akinsho/toggleterm.nvim",
		event = "VeryLazy",
		opts = {
			open_mapping = "<c-t>",
			direction = "float",
		},
	},
	{ "RRethy/vim-illuminate" }, -- highlight same symbol elsewhere
	{ "romgrk/nvim-treesitter-context", event = "VeryLazy", opts = { enable = true } }, -- show current function
	{ "mfussenegger/nvim-dap" },
	{ "rcarriga/nvim-dap-ui" },
	{ "madox2/vim-ai", event = "VeryLazy" },
	{
		"lervag/vimtex",
		ft = { "tex", "latex" },
		config = function()
			vim.cmd([[let g:vimtex_view_method = 'zathura'
                let maplocalleader='\']])
		end,
	},
}
