" prep general vim environment
" all these folders are accessible exclusively by user
if !isdirectory($HOME.'/.vim')
    call mkdir($HOME.'/.vim', '', 0700)
endif
if !isdirectory($HOME.'/.vim/undodir')
    call mkdir($HOME.'/.vim/undodir', '', 0700)
endif
if !isdirectory($HOME.'/.vim/sessions')
    call mkdir($HOME.'/.vim/sessions', '', 0700)
endif

" NOTES for other dirs in ~/.vim
" autoload is handled by vim
" plugged is handled by vimplug
" UltiSnips and black are handled by respective plugins

" NOTE: try :shell for in-vim shell stuff
set shell=/usr/bin/env\ sh

" visual settings
syntax enable                   " syntax highlighting for applicable buffers
set wrap                        " display long lines on next line
set linebreak                   " word wrap between words, not within
" NOTE: You can move the cursor inside display lines with g[hjkl]
set textwidth=0                 " wrap words to new line based on columns written.
set wrapmargin=1                " wrap words to new display line based on terminal size.
" buffer of one so that my cursor cannot appear to be on the beginning of next line when it is on the end of the previous line.
" NOTE: display line and newline are DISTINCT; display lines are still on same newline
set display+=lastline           " always show last line of paragraph
set scrolloff=3                 " show n lines above/below when scrolling
set sidescrolloff=5             " show n columns to sides when scrolling
" set colorcolumn=80            " highlight nth column

highlight CursorLineNr cterm=bold term=bold ctermfg=11  " ruler formatting

" error response settings
set noerrorbells
set novisualbell


" functional settings
set foldmethod=indent           " fold based on indent level
set nofoldenable                " no fold by default
set encoding=utf8
set termencoding=utf8
set backspace=indent,eol,start  " allow backspace across [chars]
set autoread                    " if file is changed outside vim, reload it
set autochdir                   " ensure working directory = directory of vim
set ttyfast                     " redraw faster
set undofile                    " enable preserved histories across sessions
set undodir=~/.vim/undodir      " store histories in specific dir instead of same as file
set mouse=a                     " enable mouse
" set conceallevel=1            " fold by default to maximum level
" set magic                     " grep regex instead of vim regex
" set ttimeout                  " after input, wait for more characters
" set ttimeoutlen=100           " wait 0.1s for more characters
filetype indent on              " autoindent per filetype


" formatting settings
set formatoptions-=t            " disable auto-formatting based on wrapping settings, SOMETIMES?
set autoindent                  " newlines inherit indent level
set smarttab                    " ... but only when sensible
set expandtab                   " replace tab with space
set tabstop=4                   " n-width tabs
set softtabstop=4               " do not enforce tab width on existing tabs... essentially
set shiftwidth=4                " when moving text with [<>], move by n
set shiftround                  " round 'shift' to shiftwidth


" search settings
set ignorecase                  " no case = any case
set smartcase                   " adding case = case sensitive
set hlsearch                    " highlight results
set incsearch                   " jump to nearest result as you search


" information settings
set ruler                       " display position on statusbar
set number                      " line numbers
set relativenumber              " distances from cursor in line numbers
set showmatch                   " highlight matching paired symbol
set laststatus=2                " display statusline always
set wildmenu                    " enable command completion after :
set wildmode=longest:full,list  " autocomplete to longest common string
set title                       " show vim status on title bar if applicable
set showcmd                     " show currently typed command
set history=1000                " preserve n changes


" vim efficiency settings
set lazyredraw                  " don't draw screen during command execution


" remember last edited location when reopening file, if valid
augroup remember_last_position
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END


augroup autoformat_settings
  autocmd FileType python autocmd BufWritePre <buffer> Black  " python autoformatter
  autocmd BufWritePre <buffer> %s/\s\+$//e  " clean whitespace at eol, always
augroup END


" check if remote session
let g:remoteSession = !($SSH_TTY ==? '')
if g:remoteSession
    " colorscheme gruvbox
    colorscheme darkblue
    call plug#begin()
    " for remote use
    Plug 'vim-syntastic/syntastic'              " lightweight syntax checker w/o async

    " common to local and remote sessions
    Plug 'tpope/vim-surround'                   " surround selection with paired symbols
    Plug 'airblade/vim-gitgutter'               " gitlens for vim
    Plug 'tpope/vim-fugitive'                   " git information and commands
    Plug 'vim-airline/vim-airline'              " fancy status bar
    Plug 'scrooloose/nerdtree'                  " file explorer inside vim
    call plug#end()
else
    call plug#begin()
    " local use
    " colorscheme gruvbox
    Plug 'w0rp/ale'                             " linting
    Plug 'valloric/youcompleteme', {'for': ['python', 'css', 'html', 'c', 'cpp', 'asm', 'vim', 'java', 'markdown']}
    Plug 'python/black', {'for': 'python'}      " python code formatter
    Plug 'iamcco/markdown-preview.nvim', {'for': 'markdown'}
    " NOTE: FIRST TIME SETUP FOR markdown-preview.nvim: call mkdp#util#install()
    Plug 'lervag/vimtex', {'for': 'tex'}        " LaTeX previewer
    Plug 'sirver/ultisnips', {'for': 'tex'}     " faster snippets completion

    " NOTE: you can :echo glob($VIMRUNTIME . '/ftplugin/*.vim') to see filetypes
    " NOTE: you can :PlugStatus to see running plugins

    " not using currently
    " Plug 'tpope/vim-eunuch'                   " unix terminal commands in vim
    " Plug 'jpalardy/vim-slime'                 " send buffer data to [session] i.e.
    " Plug 'Konfekt/FastFold'                   " apparently folding = slow in vim
    " Plug 'xolox/vim-session'                  " session management

    " common to local and remote sessions
    Plug 'tpope/vim-surround'                   " surround selection with paired symbols
    Plug 'airblade/vim-gitgutter'               " gitlens for vim
    Plug 'tpope/vim-fugitive'                   " git information and commands
    Plug 'vim-airline/vim-airline'              " fancy status bar
    Plug 'scrooloose/nerdtree'                  " file explorer inside vim
    call plug#end()
endif


" ycm extra conf for c and other compilation
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'

" markdown-preview.nvim
let g:mkdp_auto_start = 1                   " autostart when entering markdown buffer
let g:mkdp_auto_open = 1                    " start buffer when editing markdown, even if closed
let g:mkdp_browser = 'chromium'             " TODO: open in new window?
let g:mkdp_path_to_chrome = ''
let g:mkdp_open_to_the_world = 0            " can make preview visible on LAN


" air-line
let g:airline_powerline_fonts = 0           " TODO: what does this even do
if !exists('g:airline_symbols')
        let g:airline_symbols = {}
endif

" airline characters to use
let g:airline_left_sep = ''                 " omit for cleanliness
let g:airline_right_sep = ''
" let g:airline_left_sep = '▶'
" let g:airline_right_sep = '◀'
" let g:airline_left_alt_sep = '▶'
" let g:airline_right_alt_sep = '◀'
" let g:airline_symbols.linenr = '␊'
" let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.maxlinenr = ''        " no symbol for column num

" specific buffers/settings
let g:airline_symbols.readonly = ''
let g:airline_symbols.spell = ''            " omit spell indicator; you'll know.
" let g:airline_symbols.paste = 'ρ'
" let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'           " TODO: when is this used
let g:airline_symbols.crypt = '⩐'           " TODO: when is this used
let g:airline_symbols.whitespace = 'Ξ'      " TODO: when is this used

" git specific symbols
" let g:airline_symbols.branch = '⎇'        "
let g:airline_symbols.branch = '𝌎'          " tetragram for 'branch'
let g:airline_symbols.notexists = 'Ɇ'       " buffer not tracked by git
let g:airline_symbols.dirty='*'             " untracked changes; displays after branch name
" I use what matches my zsh prompt

let g:airline#extensions#tabline#enabled = 1  " display all open buffers on top bar
let g:airline#extensions#tabline#formatter = 'default'  " format top bar with [formatter]


" vimtex
let g:tex_flavor = 'latex'
let g:vimtex_view_method = 'zathura'
let g:vimtex_view_general_viewer = 'zathura'
let g:vimtex_compiler_progname = 'tectonic'
let g:tex_conceal='abdmg'
let g:vimtex_quickfix_ignore_all_warnings = 1
let g:vimtex_quickfix_latexlog = {
    \ 'overfull' : 0,
    \ 'underfull' : 0,
    \}


" UltiSnips
let g:UltiSnipsExpandTrigger = '<C-c>'      " TODO: could be comfier
let g:UltiSnipsJumpForwardTrigger = '<C-b>'
let g:UltiSnipsJumpBackwardTrigger = '<C-z>'


" NERDTree Settings
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeShowHidden=1
let g:NERDTreeShowBookmarks=1
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1
let g:NERDTreeHighlightFolders = 1 " enables folder icon highlighting using exact match
let g:NERDTreeHighlightFoldersFullName = 1 " highlights the folder name
