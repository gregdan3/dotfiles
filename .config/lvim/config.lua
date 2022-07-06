-- search
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.incsearch = true
vim.opt.smartcase = true

-- tabs
vim.opt.expandtab = true
vim.opt.shiftround = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4

-- visuals
vim.opt.display = "lastline"
vim.opt.lazyredraw = true
vim.opt.linebreak = true
vim.opt.scrolloff = 5
vim.opt.sidescrolloff = 8
vim.opt.termguicolors = true
vim.opt.wrap = true

-- information
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.ruler = true
vim.opt.showmatch = true -- highlight pair characters
vim.opt.showmode = false -- hide mode on status bar

-- functional
vim.opt.backspace = "indent,eol,start"
vim.opt.clipboard = "unnamedplus"
vim.opt.encoding = "utf8"
vim.opt.history = 10000
vim.opt.mouse = "a"
vim.opt.shell = "/bin/fish"
-- vim.opt.undodir = "${HOME}/.local/share/nvim/undodir"
vim.opt.wildmode = "longest,full"
vim.cmd([[filetype plugin indent on]])

-- buffers
vim.opt.autoread = true
vim.opt.hidden = true
vim.opt.splitbelow = true
vim.opt.splitright = true

-- mappings
vim.keymap.set({ "n", "v" }, ";", ":", { remap = true })
vim.keymap.set({ "n" }, "<CR>", ":noh<CR><CR>", { silent = true })
vim.keymap.set({ "n" }, "<Leader>,", ":set invlist<CR>", { silent = true })
vim.keymap.set({ "n", "i" }, "<Up>", "<NOP>", { silent = true })
vim.keymap.set({ "n", "i" }, "<Down>", "<NOP>", { silent = true })
vim.keymap.set({ "n", "i" }, "<Left>", "<NOP>", { silent = true })
vim.keymap.set({ "n", "i" }, "<Right>", "<NOP>", { silent = true })

-- lvim
lvim.log.level = "warn"
lvim.format_on_save = true
lvim.colorscheme = "onedarker"

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"

-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- we use protected-mode (pcall) just in case the plugin wasn't loaded yet.
-- local _, actions = pcall(require, "telescope.actions")
-- lvim.builtin.telescope.defaults.mappings = {
--   -- for input mode
--   i = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--     ["<C-n>"] = actions.cycle_history_next,
--     ["<C-p>"] = actions.cycle_history_prev,
--   },
--   -- for normal mode
--   n = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--   },
-- }

-- Use which-key to add extra bindings with the leader-key prefix
-- lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
-- lvim.builtin.which_key.mappings["t"] = {
--   name = "+Trouble",
--   r = { "<cmd>Trouble lsp_references<cr>", "References" },
--   f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
--   d = { "<cmd>Trouble document_diagnostics<cr>", "Diagnostics" },
--   q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
--   l = { "<cmd>Trouble loclist<cr>", "LocationList" },
--   w = { "<cmd>Trouble workspace_diagnostics<cr>", "Wordspace Diagnostics" },
-- }

lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.notify.active = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.show_icons.git = 1

lvim.builtin.treesitter.ensure_installed = {
	"bash",
	"c",
	"css",
	"fish",
	"java",
	"javascript",
	"json",
	"lua",
	"markdown",
	"python",
	"rust",
	"tsx",
	"typescript",
	"yaml",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true

local formatters = require("lvim.lsp.null-ls.formatters")
formatters.setup({
	{ command = "black", filetypes = { "python" } },
	{ command = "isort", filetypes = { "python" } },
	{ command = "rustfmt", filetypes = { "rust" } },
	{ command = "shfmt", filetypes = { "bash" } },
	{ command = "stylua", filetypes = { "lua" } },
	{
		command = "prettier",
		extra_args = { "--print-with=100" },
		filetypes = { "typescript", "typescriptreact", "html", "css", "md", "markdown" },
	},
})
local linters = require("lvim.lsp.null-ls.linters")
linters.setup({
	{
		command = "shellcheck",
		extra_args = { "--severity", "warning" },
	},
	{ command = "checkmake", filetypes = { "Makefile" } },
	{ command = "hadolint", filetypes = { "docker" } },
})

-- Additional Plugins
lvim.plugins = {
	{
		"folke/trouble.nvim",
		cmd = "TroubleToggle",
	},
	{
		"echasnovski/mini.nvim",
		-- after = "nvim-web-devicons",
		config = function()
			require("mini.indentscope").setup()
			require("mini.sessions").setup()
			-- require("mini.surround").setup()
			require("mini.trailspace").setup()
		end,
	},
	{
		"iamcco/markdown-preview.nvim",
		run = "cd app && yarn install",
		cmd = "MarkdownPreview",
	},
	{
		"ggandor/lightspeed.nvim",
		event = "BufEnter",
		config = function()
			require("lightspeed")
		end,
	},
	-- {
	--     "wfxr/minimap.vim",
	--     run = "cargo install --locked code-minimap",
	--     -- cmd = { "Minimap", "MinimapClose", "MinimapToggle", "MinimapRefresh", "MinimapUpdateHighlight" },
	--     config = function()
	--         vim.cmd("let g:minimap_width = 10")
	--         vim.cmd("let g:minimap_auto_start = 1")
	--         vim.cmd("let g:minimap_auto_start_win_enter = 1")
	--     end,
	-- },
	{
		"ahmedkhalf/lsp-rooter.nvim",
		event = "BufRead",
		config = function()
			require("lsp-rooter").setup()
		end,
	},
	{ "hrsh7th/cmp-cmdline", after = "cmp-path" },
	{
		"tpope/vim-fugitive",
		cmd = {
			"G",
			"Git",
			"Gdiffsplit",
			"Gread",
			"Gwrite",
			"Ggrep",
			"GMove",
			"GDelete",
			"GBrowse",
			"GRemove",
			"GRename",
			"Glgrep",
			"Gedit",
		},
		ft = { "fugitive" },
	},
}

vim.api.nvim_create_autocmd(
	"BufReadPost",
	{ pattern = "*", command = [[if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif]] }
)
vim.api.nvim_create_autocmd("FileType", { pattern = "md,markdown,svn,*commmit*", command = [[setlocal spell]] })