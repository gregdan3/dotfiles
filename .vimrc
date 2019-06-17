" visual settings
syntax enable
set ruler
set wrap
set linebreak
set showmatch
" set cc=81


" functional settings
set autoindent
set smartindent
set smarttab
set expandtab
set tabstop=4
set shiftwidth=4
set encoding=utf8
set termencoding=utf8
set autochdir
" set spell
set ttyfast 						"redraw faster 
set undofile
set undodir=~/.vim/undodir
set mouse=a

" search settings
set ignorecase
set smartcase
set hlsearch
set incsearch


" information settings
set number
set relativenumber
set laststatus=2
set wildmenu
set wildmode=longest,full,list
set title							
set history=1000

" autoclean whitespace for specified filetypes
    autocmd FileType c,cpp,java,php,python,javascript,css,html,markdown autocmd BufWritePre <buffer> %s/\s\+$//e


" if remote session:
" change color scheme
" don't use heavier plugins
let g:remoteSession = !($SSH_TTY ==? '')
if g:remoteSession
    colorscheme darkblue
    call plug#begin()
    Plug 'vim-syntastic/syntastic'       "lightweight syntax checker
    Plug 'airblade/vim-gitgutter'        "gitlens for vim
    Plug 'tpope/vim-fugitive'			 "git information and commands
    Plug 'tpope/vim-surround'            "surround selection with paired symbols
    Plug 'vim-airline/vim-airline'		 "fancy status bar
    Plug 'scrooloose/nerdtree'			 "file explorer inside vim
    call plug#end()
else
    call plug#begin()
    Plug 'valloric/youcompleteme'		 "auto-completer for a lot of languages
    Plug 'w0rp/ale'						 "linting
    Plug 'airblade/vim-gitgutter'        "gitlens for vim
    Plug 'python/black'                  "python code formatter
    Plug 'tpope/vim-fugitive'			 "git information and commands
    Plug 'tpope/vim-surround'            "surround selection with paired symbols
    Plug 'vim-airline/vim-airline'		 "fancy status bar
    Plug 'scrooloose/nerdtree'			 "file explorer inside vim
    " Plug 'lervag/vimtex'                 "LaTeX helper
    " Plug 'tpope/vim-eunuch'              "unix terminal commands in vim
    " Plug 'jpalardy/vim-slime'            "repl in vim
    " Plug 'xuyuanp/nerdtree-git-plugin'   "display git info for file explorer
    " Plug 'ccraciun/vim-dreammaker'       "syntax highlighting for BYOND
    call plug#end()
endif

" air-line
" let g:airline_powerline_fonts = 1
" if !exists('g:airline_symbols')
" 		let g:airline_symbols = {}
" endif

" let g:airline_left_sep = '»'
" let g:airline_left_sep = '▶'
" let g:airline_right_sep = '«'
" let g:airline_right_sep = '◀'
" let g:airline_symbols.linenr = '␊'
" let g:airline_symbols.linenr = '␤'
" let g:airline_symbols.linenr = '¶'
" let g:airline_symbols.branch = '䷖'
" let g:airline_symbols.paste = 'ρ'
" let g:airline_symbols.paste = 'Þ'
" let g:airline_symbols.paste = '∥'
" let g:airline_symbols.whitespace = 'Ξ'

let g:airline_powerline_fonts = 0
let g:airline_symbols_ascii = 1

" keybinds
map <C-n> :NERDTreeToggle<CR>

" Borrowed from http://dotshare.it/dots/8329/
" Ignore these filenames during enhanced command line completion.
set wildignore+=*/.idea/*,*/.project/*    " ignore IDE project files
set wildignore+=*/.git/*,*/.hg/*,*/.svn/* " ignore version control files
set wildignore+=*.aux,*.out,*.toc " LaTeX intermediate files
set wildignore+=*.jpg,*.bmp,*.gif " binary images
set wildignore+=*.luac            " Lua byte code
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest,*.so,*.zip  " compiled object files
set wildignore+=*.pyc             " Python byte code
set wildignore+=*.spl             " compiled spelling word lists
set wildignore+=*.sw?             " Vim swap files
set wildignore+=.DS_Store         " Mac files
set wildignore+=*/tmp/*           " MacOSX/Linux
set wildignore+=*\\tmp\\*         " Windows
" }}}
