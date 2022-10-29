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
vim.opt.timeoutlen = 200
-- vim.opt.mouse = ""
-- vim.opt.mousemodel = ""
vim.opt.shell = "/bin/fish"
vim.opt.wildmode = "longest,full"
vim.cmd([[filetype plugin indent on]])

-- buffers
vim.opt.autoread = true
vim.opt.hidden = true

-- mappings
vim.keymap.set({ "n", "v" }, ";", ":", { remap = true })
vim.keymap.set({ "n" }, "<CR>", ":noh<CR><CR>", { silent = true })
vim.keymap.set({ "n", "i" }, "<Up>", "<NOP>", { silent = true })
vim.keymap.set({ "n", "i" }, "<Down>", "<NOP>", { silent = true })
vim.keymap.set({ "n", "i" }, "<Left>", "<NOP>", { silent = true })
vim.keymap.set({ "n", "i" }, "<Right>", "<NOP>", { silent = true })
vim.keymap.set({ "i" }, "jj", "<ESC>", { silent = true })

vim.g["vimtex_view_method"] = "zathura"

-- lvim
lvim.log.level = "warn"
lvim.format_on_save = true
lvim.colorscheme = "onedarker"
lvim.leader = "space"

lvim.builtin.alpha.active = false
lvim.builtin.nvimtree.active = false
lvim.builtin.lir.active = false
lvim.builtin.illuminate.active = false

lvim.builtin.breadcrumbs.active = false
lvim.builtin.notify.active = true
lvim.builtin.terminal.active = true

lvim.builtin.terminal.open_mapping = "<c-t>"
lvim.builtin.gitsigns.opts.current_line_blame = false

lvim.builtin.which_key.mappings.P = { "<cmd>Telescope projects<CR>", "Projects" }
lvim.builtin.which_key.mappings[";"] = nil -- needed if alpha is disabled
lvim.builtin.which_key.mappings.g.D = { "<cmd>Gitsigns diffthis HEAD<cr>", "Git Diff" }
lvim.builtin.which_key.mappings.g.d = { "<cmd>Gitsigns diffthis<cr>", "Git Diff" }

lvim.builtin.which_key.mappings.T.m = { "<cmd>TSModuleInfo<CR>", "Module info" }
lvim.builtin.which_key.mappings.T.u = { "<cmd>TSUpdate<CR>", "Update" }
lvim.builtin.which_key.mappings.T.U = { "<cmd>TSUpdateSync<CR>", "Update+sync" }

lvim.builtin.which_key.vmappings["s"] = {
	name = "Sort",
	a = { "<cmd>'<, '>%sort<cr>", "ASC" },
	d = { "<cmd>'<, '>%sort!<cr>", "DESC" },
	n = { "<cmd>'<, '>%sort n<cr>", "DESC INT" },
}

-- lvim.builtin.which_key.mappings.g.w = {
-- 	"<cmd>lua lvim.builtin.gitsigns.opts.word_diff = not lvim.builtin.gitsigns.opts.word_diff<CR>",
-- 	"Toggle word diff",
-- } -- TODO: value is not listened, only checked at startup.

lvim.builtin.treesitter.ensure_installed = {
	"bash",
	"c",
	"c_sharp",
	"comment",
	"cpp",
	"css",
	"dockerfile",
	"fish",
	"go",
	"html",
	"java",
	"javascript",
	"json",
	"lua",
	"markdown",
	"markdown_inline",
	"python",
	"regex",
	"rust",
	"sql",
	"toml",
	"typescript",
	"yaml",
}
local formatters = require("lvim.lsp.null-ls.formatters")
formatters.setup({
	{ command = "black", filetypes = { "python" } },
	{ command = "isort", filetypes = { "python" } },
	{
		command = "prettier",
		extra_args = { "--print-width", "80" },
		filetypes = { "javascript", "js", "typescript", "typescriptreact", "html", "css", "markdown", "yaml" },
	},
	{ command = "rustfmt", filetypes = { "rust" } },
	{ command = "shfmt", filetypes = { "sh", "bash" } },
	{ command = "stylua", filetypes = { "lua" } },
	-- { command = "sql-formatter", filetypes = { "sql" } },
})
local linters = require("lvim.lsp.null-ls.linters")
linters.setup({
	{ command = "shellcheck", filetypes = { "sh", "bash" } },
	{ command = "checkmake", filetypes = { "Makefile" } },
	{ command = "hadolint", filetypes = { "docker" } },
	{ command = "rubocop", filetypes = { "ruby" } },
})

-- Additional Plugins
lvim.plugins = {
	{
		"lervag/vimtex",
		event = "BufEnter",
		filetype = "tex",
		config = function() end,
	},
	{
		"ggandor/lightspeed.nvim",
		event = "BufEnter",
		config = function()
			require("lightspeed")
		end,
	},
	{
		"jayp0521/mason-null-ls.nvim",
		after = {
			"null-ls.nvim",
			"mason.nvim",
		},
		config = function()
			require("mason-null-ls").setup({
				auto_update = true,
				automatic_installation = true,
			})
		end,
	},
}

vim.api.nvim_create_autocmd(
	"BufReadPost",
	{ pattern = "*", command = [[if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif]] }
)

lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"
