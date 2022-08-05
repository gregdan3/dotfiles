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

-- lvim
lvim.log.level = "warn"
lvim.format_on_save = true
lvim.colorscheme = "onedarker"
lvim.leader = "space"

lvim.builtin.alpha.active = false
lvim.builtin.gitsigns.opts.current_line_blame = true
lvim.builtin.notify.active = true
lvim.builtin.terminal.active = true

lvim.builtin.which_key.mappings.P = { "<cmd>Telescope projects<CR>", "Projects" }
lvim.builtin.which_key.mappings[";"] = nil -- needed if alpha is disabled
-- lvim.builtin.which_key.mappings.g.d -- TODO: diff against staged?

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
		filetypes = { "typescript", "typescriptreact", "html", "css", "markdown", "yaml" },
	},
	{ command = "rustfmt", filetypes = { "rust" } },
	{ command = "shfmt", filetypes = { "sh", "bash" } },
	{ command = "stylua", filetypes = { "lua" } },
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
		"ggandor/lightspeed.nvim",
		event = "BufEnter",
		config = function()
			require("lightspeed")
		end,
	},
}

vim.api.nvim_create_autocmd(
	"BufReadPost",
	{ pattern = "*", command = [[if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif]] }
)
