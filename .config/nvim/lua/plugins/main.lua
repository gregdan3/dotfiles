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
					-- nls.builtins.diagnostics.pydocstyle,

					nls.builtins.formatting.beautysh,
					nls.builtins.formatting.prettier.with({ extra_filetypes = { "svelte", "astro", "mdx", "svx" } }),
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
					-- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
					-- they way you will only jump inside the snippet region
					elseif luasnip.expand_or_jumpable() then
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
		},
	},
	{ "RRethy/vim-illuminate" }, -- highlight same symbol elsewhere
	{ "romgrk/nvim-treesitter-context", event = "VeryLazy", opts = { enable = true } }, -- show current function
	{ "mfussenegger/nvim-dap" },
	{ "rcarriga/nvim-dap-ui" },
}
