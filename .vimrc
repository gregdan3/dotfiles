" visual settings
syntax enable                   " color text in files that allow it
set ruler                       " display position on statusbar
set wrap                        " display long lines on next line
set linebreak
set showmatch                   " highlight matching paired symbol

" functional settings
" set foldmethod=indent
" set conceallevel=1
set autoindent
set smarttab
set expandtab
set tabstop=4
set shiftwidth=4
set encoding=utf8
set termencoding=utf8
set autochdir                   " ensure working directory = directory of vim
set ttyfast                     " redraw faster 
set undofile                    " enable preserved histories across sessions
set undodir=~/.vim/undodir      " store histories in specific dir instead of same as file
set mouse=a                     " enable mouse
filetype indent on              " autoindent per filetype


" search settings
set ignorecase                  " no case = any case
set smartcase                   " adding case = case sensitive
set hlsearch                    " highlight results
set incsearch                   " jump to nearest result as you search


" information settings
set number                      " line numbers
set relativenumber              " distances from cursor in line numbers
set laststatus=2                " display statusline always
set wildmenu                    " 
set wildmode=longest,full,list  " 
set title                       "      
set showcmd                     " show currently typed command
set history=1000                " preserve n changes 

" autoclean whitespace for specified filetypes
    autocmd FileType c,cpp,java,php,python,javascript,css,html,markdown,yaml,tex autocmd BufWritePre <buffer> %s/\s\+$//e
" autorun PythonBlack in python files
    autocmd FileType python autocmd BufWritePre <buffer> Black

" check if remote session
let g:remoteSession = !($SSH_TTY ==? '')
if g:remoteSession
    colorscheme darkblue
    call plug#begin()
    " unique to remote use
    Plug 'vim-syntastic/syntastic'       "lightweight syntax checker

    " common to local and remote sessions
    " Plug 'tpope/vim-surround'            "surround selection with paired symbols
    Plug 'airblade/vim-gitgutter'        "gitlens for vim
    Plug 'tpope/vim-fugitive'            "git information and commands
    Plug 'vim-airline/vim-airline'       "fancy status bar
    Plug 'scrooloose/nerdtree'           "file explorer inside vim
    call plug#end()
else
    call plug#begin()
    " unique to local use
    Plug 'w0rp/ale'                      "linting
    Plug 'valloric/youcompleteme'        "auto-completer for a lot of languages
    Plug 'python/black', {'for': 'python'} "python code formatter
    Plug 'lervag/vimtex', {'for': 'tex'}   "LaTeX helper
    Plug 'sirver/ultisnips', {'for': 'tex'}  " faster snippets completion

    " NOTE: you can :echo glob($VIMRUNTIME . '/ftplugin/*.vim') to see filetypes
    " NOTE: you can :PlugStatus to see running plugins

    " not using currently
    " Plug 'tpope/vim-eunuch'            "unix terminal commands in vim
    " Plug 'jpalardy/vim-slime'          "repl in vim
    " Plug 'xuyuanp/nerdtree-git-plugin' "display git info for file explorer
    " Plug 'tpope/vim-surround'          "surround selection with paired symbols

    " common to local and remote sessions
    Plug 'airblade/vim-gitgutter'        "gitlens for vim
    Plug 'tpope/vim-fugitive'            "git information and commands
    Plug 'vim-airline/vim-airline'       "fancy status bar
    Plug 'scrooloose/nerdtree'           "file explorer inside vim
    call plug#end()
endif

" ycm extra conf for c and other compilation
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'

" air-line
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
        let g:airline_symbols = {}
endif

let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '䷖'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'


" vimtex
let g:tex_flavor = 'latex'
let g:vimtex_view_method = 'zathura'
let g:vimtex_view_general_viewer = 'zathura'
let g:vimtex_compiler_progname = 'latexmk'
let g:tex_conceal='abdmg'

" UltiSnips
let g:UltiSnipsExpandTrigger = '<C-c>'
let g:UltiSnipsJumpForwardTrigger = '<C-b>'
let g:UltiSnipsJumpBackwardTrigger = '<C-z>'


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
