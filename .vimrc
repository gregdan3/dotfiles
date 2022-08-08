if !isdirectory($HOME.'/.vim') | call mkdir($HOME.'/.vim', '', 0700) | endif
if !isdirectory($HOME.'/.vim/undodir') | call mkdir($HOME.'/.vim/undodir', '', 0700) | endif
let g:remoteSession = !($SSH_TTY ==? '')
if g:remoteSession | colorscheme slate | else | colorscheme default | endif

" bugfixes
set t_RV= t_ut=                     " disable term version query, bg color erase

" visual settings
syntax enable
set noshowmode showmatch            " hide MODE on statusbar, highlight paired symbols
set wrap linebreak display=lastline " wrap display line between words, no filler chars
set scrolloff=12 sidescrolloff=12   " visual buffer around cursor, in chars
set noerrorbells novisualbell
hi clear SignColumn                 " for some reason, sign column wasn't using bgcolor

hi DiffAdd     cterm=italic     ctermfg=Green    ctermbg=none
hi DiffChange  cterm=none       ctermfg=Yellow   ctermbg=none
hi DiffDelete  cterm=bold       ctermfg=Red      ctermbg=none
hi DiffText    cterm=undercurl  ctermul=Yellow   ctermbg=none

" functional settings
set encoding=utf8 termencoding=utf8 " always write utf-8 encoded files
scriptencoding=utf8                 " this file has multibyte chars
set backspace=indent,eol,start      " allow backspace across [chars]
set autoread hidden                 " reload on change, allow unfocused edited buffers
set ttyfast lazyredraw              " render faster, don't render during commands
set undofile undodir=~/.vim/undodir history=5000  " maintain history
set mouse=a ttymouse=sgr            " enable mouse
set splitbelow splitright           " split like i3
set clipboard^=unnamedplus          " use system clipboard
set ignorecase smartcase hlsearch incsearch       " convenient search options
set shiftround expandtab shiftwidth=4 tabstop=4   " tab behavior defaults
set textwidth=80 formatoptions+=tc  " wrap to newline at textwidth, respecting comments
set completeopt=menuone,noinsert,noselect   " use menu, don't insert/select unless user chooses
filetype plugin indent on

" information
set ruler number relativenumber     " sidebar line numbers, statusbar column number
set wildmenu wildmode=longest,full  " command completion menu behavior
set showcmd                         " show currently typed command

" keybinds/remaps/rebinds
nnoremap <silent> <CR> :noh<CR><CR>
map <SPACE> <Leader>
let mapleader=' '
map ; :

" autocommands
augroup recall_pos | au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif | augroup END

" PLUGIN SETTINGS
call plug#begin()
    Plug 'airblade/vim-gitgutter'       " gitlens for vim
    Plug 'airblade/vim-rooter'          " always change cwd to git root
    Plug 'easymotion/vim-easymotion'    " jump to target
    Plug 'tpope/vim-commentary'         " comment out lines with gc + operator
    Plug 'tpope/vim-fugitive'           " git information and commands
    Plug 'tpope/vim-sleuth'             " auto-adjust tab behavior based on open file
    Plug 'vim-airline/vim-airline'      " fancy status bar
call plug#end()

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1                " display open buffers+tabs on top bar

let g:EasyMotion_smartcase = 1
let g:EasyMotion_startofline = 0
map  s <Plug>(easymotion-s2)
map  t <Plug>(easymotion-t2)
map  T <Plug>(easymotion-T2)
map  f <Plug>(easymotion-lineforward)
map  F <Plug>(easymotion-linebackward)
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)

nnoremap <silent> <C-g> :Git commit<CR>
nnoremap <silent> <C-d> :Gvdiffsplit<CR>
