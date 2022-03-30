local vim = vim

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
vim.opt.display = 'lastline'
vim.opt.lazyredraw = true
vim.opt.linebreak = true
vim.opt.scrolloff = 5
vim.opt.sidescrolloff = 8
vim.opt.termguicolors = true
vim.opt.wrap = true
vim.cmd [[hi clear SignColumn]]
vim.cmd [[syntax enable]]

-- information
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.ruler = true
vim.opt.showmatch = true -- highlight pair characters
vim.opt.showmode = false -- hide mode on status bar

-- functional
vim.opt.backspace = 'indent,eol,start'
vim.opt.clipboard = 'unnamedplus'
vim.opt.encoding = 'utf8'
vim.opt.history = 10000
vim.opt.mouse = 'a'
vim.opt.shell = '/bin/fish'
-- vim.opt.undodir = '~/.local/share/nvim/undodir'
vim.opt.wildmode = 'longest,full'
vim.cmd [[filetype plugin indent on]]

-- buffers
vim.opt.autoread = true
vim.opt.hidden = true
vim.opt.splitbelow = true
vim.opt.splitright = true

-- mappings
vim.g.mapleader = " "
vim.keymap.set({'n', 'v'}, ';', ':', {remap = true})
vim.keymap.set({'n'}, '<CR>', ':noh<CR><CR>', {silent = true})
vim.keymap.set({'n'}, '<Leader>,', ':set invlist<CR>', {silent = true})

-- au.BufWrite = function() vim.lsp.buf.formatting() end

vim.cmd [[
" augroup recall_pos | au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif | augroup END
" augroup filetype_settings | autocmd FileType md,markdown,svn,*commit* setlocal spell | augroup END
" augroup formatter | au BufWrite * call lua(require('vim').lsp.buf.formatting()) | augroup END
]]

