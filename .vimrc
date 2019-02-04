" visual settings
syntax enable
set ruler
set wrap
set linebreak
set showmatch


" functional settings
set autoindent
set smartindent
set smarttab
set tabstop=4
set encoding=utf8
set termencoding=utf8
set autochdir
" set spell
set ttyfast 						"redraw faster 


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


" plugins
call plug#begin()
Plug 'valloric/youcompleteme'		 "auto-completer for a lot of languages
Plug 'tpope/vim-surround'			 "select a word to add some paired symbol around it
Plug 'tpope/vim-fugitive'			 "git information and commands
Plug 'yggdroot/indentline'			 "display indent line 
Plug 'vim-airline/vim-airline'		 "fancy status bar
Plug 'jiangmiao/auto-pairs'			 "auto-typing closing characters
Plug 'scrooloose/nerdtree'			 "file explorer inside vim
Plug 'xuyuanp/nerdtree-git-plugin'	 "display git info for file explorer
Plug 'scrooloose/syntastic'			 "variant linter
Plug 'w0rp/ale'						 "linting
call plug#end()


" autorun
" autocmd vimenter * NERDTreeToggle


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
