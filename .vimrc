" prep general vim environment
" all these folders are accessible exclusively by user
if !isdirectory($HOME.'/.vim')
    call mkdir($HOME.'/.vim', '', 0700)
endif
if !isdirectory($HOME.'/.vim/undodir')
    call mkdir($HOME.'/.vim/undodir', '', 0700)
endif

" check if remote session
let g:remoteSession = !($SSH_TTY ==? '')

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
set encoding=utf8               " always write utf-8 encoded files
set termencoding=utf8           " characters appear in utf-8
set backspace=indent,eol,start  " allow backspace across [chars]
set autoread                    " if file is changed outside vim, reload it
set autochdir                   " ensure working directory = directory of vim
set ttyfast                     " redraw faster
set undofile                    " enable preserved histories across sessions
set undodir=~/.vim/undodir      " store histories in specific dir instead of same as file
set mouse=a                     " enable mouse
set ttymouse=sgr                " change how vim understands mouse inputs
set splitbelow                  " Open :split buffers on bottom
set splitright                  " Open :vsplit buffers on right
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


" remaps
" let mapleader=''              " TODO: choose a leader

" Easier buffer navigation
nnoremap <C-H> <C-W><C-H>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
" hjkl needs Ctrl but arrow keys do not?
nnoremap <C-Left> <C-W><Left>
nnoremap <C-Down> <C-W><Down>
nnoremap <C-Up> <C-W><Up>
nnoremap <C-Right> <C-W><Right>

" disable arrow key navigation
" nnoremap <Left> :echoe "Use h to move left!"<CR>
" nnoremap <Right> :echoe "Use l to move right!"<CR>
" nnoremap <Up> :echoe "Use k to move up!"<CR>
" nnoremap <Down> :echoe "Use j to move down!"<CR>


" autocommands
" remember last edited location when reopening file, if valid
augroup remember_last_position
    au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END

augroup autoformatters
    autocmd BufWritePre <buffer> %s/\s\+$//e    " clean whitespace at eol, always
augroup END


let otherTypes = ['c', 'cpp', 'java', 'ruby', 'html', 'css', 'js', 'javascript', 'haskell', 'vim', 'tex', 'plaintex']
" keep track of alternative types for autoformat to run in

""""""""""""""""""""""""""""""""""""""""""""""""
" PLUGIN SETTINGS EXCLUSIVELY BELOW THIS POINT "
""""""""""""""""""""""""""""""""""""""""""""""""
if g:remoteSession                              " remote plugins
    " colorscheme gruvbox
    colorscheme darkblue
    call plug#begin()
    Plug 'vim-syntastic/syntastic'              " linter w/o async

    " common to local and remote sessions
    Plug 'airblade/vim-gitgutter'               " gitlens for vim
    Plug 'tpope/vim-fugitive'                   " git information and commands
    Plug 'vim-airline/vim-airline'              " fancy status bar
    Plug 'scrooloose/nerdtree'                  " file explorer inside vim
    call plug#end()
else                                            " local plugins
    call plug#begin()
    " local use
    Plug 'w0rp/ale'                             " linter

    Plug 'valloric/youcompleteme'               " autocompletion engine
    " NOTE: DO NOT ENABLE FOR TEX FILES! 500+ word buffers stress the CPU
    " TODO: disable for tex/plaintex buffers automatically?
    Plug 'iamcco/markdown-preview.nvim', {'for': 'markdown'}
    " NOTE: FIRST TIME SETUP FOR markdown-preview.nvim: call mkdp#util#install()
    " TODO: Find a way to do this automatically?

    " only for LaTeX
    Plug 'lervag/vimtex', {'for': ['tex', 'plaintex']}        " LaTeX previewer
    Plug 'sirver/ultisnips', {'for': ['tex', 'plaintex']}     " faster snippets completion

    " formatters
    Plug 'python/black', {'for': 'python'}
    Plug 'rust-lang/rust.vim', {'for': 'rust'}  " this comes with other cool things too
    Plug 'Chiel92/vim-autoformat', {'for': otherTypes}

    " NOTE: you can :echo glob($VIMRUNTIME . '/ftplugin/*.vim') to see filetypes available
    " NOTE: you can :PlugStatus to see running plugins

    " not using currently
    " Plug 'google/vim-codefmt', {'for': otherTypes}
    " Plug 'tpope/vim-eunuch'                   " unix terminal commands in vim
    " Plug 'jpalardy/vim-slime'                 " send buffer data to [session]
    " Plug 'Konfekt/FastFold'                   " apparently folding = slow in vim
    " Plug 'tpope/vim-surround'                 " surround selection with paired symbols

    " common to local and remote sessions
    Plug 'airblade/vim-gitgutter'               " gitlens for vim
    Plug 'tpope/vim-fugitive'                   " git information and commands
    Plug 'vim-airline/vim-airline'              " fancy status bar
    Plug 'scrooloose/nerdtree'                  " file explorer inside vim
    call plug#end()
endif

" remaps for plugins
nmap <C-n> :NERDTreeToggle<CR>                  " open NERDTree with Ctrl+n in normal mode

nmap <leader>1 <Plug>AirlineSelectTab1          " i3-style buffer selection while in normal mode
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9


" autocommands for plugins
augroup autoformatters_plugins
    autocmd FileType python autocmd BufWritePre <buffer> Black
    autocmd FileType rust autocmd BufWritePre <buffer> RustFmt
    autocmd FileType otherTypes autocmd BufWritePre <buffer> Autoformat     " autoformatter using any installed formatter
augroup END


" NERDTree Settings
let g:NERDTreeShowHidden=1
let g:NERDTreeShowBookmarks=1
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1
let g:NERDTreeHighlightFolders = 1              " enables folder icon highlighting using exact match
let g:NERDTreeHighlightFoldersFullName = 1      " highlights the folder name


" air-line
let g:airline_powerline_fonts = 0               " TODO: what does this even do
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_left_sep = ''                     " omit for cleanliness
let g:airline_right_sep = ''
" let g:airline_left_sep = '▶'
" let g:airline_right_sep = '◀'
" let g:airline_left_alt_sep = '▶'
" let g:airline_right_alt_sep = '◀'
" let g:airline_symbols.linenr = '␊'
" let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.maxlinenr = ''            " no symbol for column num

" specific buffers/settings
let g:airline_symbols.readonly = ''
let g:airline_symbols.spell = ''                " omit spell indicator; you'll know.
" let g:airline_symbols.paste = 'ρ'
" let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'               " TODO: when are these three used
let g:airline_symbols.crypt = '⩐'
let g:airline_symbols.whitespace = 'Ξ'

" git specific symbols
let g:airline_symbols.branch = '𝌎'              " tetragram for 'branch'
let g:airline_symbols.notexists = 'Ɇ'           " buffer not tracked by git
let g:airline_symbols.dirty='*'                 " untracked changes; displays after branch name
" I use what matches my zsh prompt

let g:airline#extensions#tabline#enabled = 1                " display all open buffers on top bar
" let g:airline#extensions#tabline#tab_nr_type = 1            " how to format tab number type
" let g:airline#extensions#tabline#show_tab_nr = 1            " what # tab is this
" let g:airline#extensions#tabline#buffer_nr_show = 1         " what # buffer is this
let g:airline#extensions#tabline#nametruncate = 16          " max buffer name of 16 chars
let g:airline#extensions#tabline#fnamecollapse = 2          " max buffer name of 16 chars
let g:airline#extensions#tabline#formatter = 'default'      " format top bar with [formatter]


" markdown-preview.nvim
let g:mkdp_auto_start = 1                   " autostart when entering markdown buffer
let g:mkdp_auto_open = 1                    " start buffer when editing markdown, even if closed
let g:mkdp_browser = 'chromium'             " TODO: open in new window?
let g:mkdp_path_to_chrome = ''
let g:mkdp_open_to_the_world = 0            " can make preview visible on LAN


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


" ycm extra conf for c and other compilation
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
