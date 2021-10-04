if !isdirectory($HOME.'/.vim') | call mkdir($HOME.'/.vim', '', 0700) | endif
if !isdirectory($HOME.'/.vim/undodir') | call mkdir($HOME.'/.vim/undodir', '', 0700) | endif

let g:plugin_development = 0
let g:hardtime_default_on = 1
let g:remoteSession = !($SSH_TTY ==? '')
if g:remoteSession | colorscheme slate | else | colorscheme default | endif
if filereadable('/bin/fish') | set shell=/bin/fish\ --login | else | set shell=/bin/bash\ --login | endif

" bugfixes
" vint: -ProhibitSetNoCompatible
set nocompatible                    " appease vimwiki
set t_RV= t_ut=                     " disable term version query, bg color erase
let &t_Cs="\e[4:3m"                 " tell vim how to print undercurl
let &t_Ce="\e[4:0m"                 " and end it. Should be detected, but nope

" visual settings
syntax enable                       " syntax highlighting for applicable buffers
set noshowmode showmatch            " hide MODE on statusbar, highlight paired symbols
set wrap linebreak display=lastline " wrap display line between words, no filler chars
set scrolloff=12 sidescrolloff=12   " visual buffer around editing area
set noerrorbells novisualbell       " no bells
hi clear SignColumn                 " for some reason, sign column wasn't using bgcolor

if !has('nvim')
  hi DiffAdd     cterm=italic     ctermfg=Green    ctermbg=none
  hi DiffChange  cterm=none       ctermfg=Yellow   ctermbg=none
  hi DiffDelete  cterm=bold       ctermfg=Red      ctermbg=none
  hi DiffText    cterm=undercurl  ctermul=Yellow   ctermbg=none
  hi SpellBad    cterm=undercurl  ctermul=Red      ctermbg=none
else
  " TODO
endif

" functional settings
set encoding=utf8 termencoding=utf8 " always write utf-8 encoded files
scriptencoding=utf8                 " this file has multibyte chars
set backspace=indent,eol,start      " allow backspace across [chars]
set autoread hidden                 " reload on change, allow unfocused edited buffers
set ttyfast lazyredraw              " render faster, don't render during commands
set undofile undodir=~/.vim/undodir history=5000  " maintain history
if !g:hardtime_default_on | set mouse=a | else | set mouse= | endif
set splitbelow splitright           " split like i3
set clipboard^=unnamedplus          " use system clipboard always
set ignorecase smartcase hlsearch incsearch       " convenient search options
set shiftround expandtab shiftwidth=4 tabstop=4   " tab behavior defaults
set textwidth=80 formatoptions+=tc  " wrap to newline at textwidth, respecting comments
set completeopt=menuone,noinsert,noselect   " use menu, don't insert/select unless user chooses
filetype plugin indent on           " autoindent+plugins per filetype

" information
set ruler number relativenumber     " sidebar line numbers, statusbar column number
set wildmenu wildmode=longest:full,list     " command completion menu behavior
set showcmd                         " show currently typed command

" keybinds/remaps/rebinds
nnoremap <silent> <CR> :noh<CR><CR>
nnoremap <silent> <Leader>, :set invlist<CR>
tnoremap <c-b> <c-\><c-n>
map <SPACE> <Leader>
let mapleader=' '               " map leader to space
map ; :
map j gj
map k gk

" autocommands
augroup recall_pos | au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif | augroup END
augroup filetype_settings | autocmd FileType md,markdown,svn,*commit* setlocal spell | augroup END

" PLUGIN SETTINGS
call plug#begin()
    " big features
    Plug 'dense-analysis/ale'           " linting, completion, formatting
    Plug 'easymotion/vim-easymotion'    " jump to target
    Plug 'honza/vim-snippets'           " pre-made snippets
    Plug 'jpalardy/vim-slime'           " send buffer data to [session]
    Plug 'junegunn/fzf', {'do': {-> fzf#install()}}  " install fzf
    Plug 'junegunn/fzf.vim'             " fzf integration for vim
    Plug 'shougo/deoplete.nvim'         " More supported completion pop-up
    Plug 'sirver/UltiSnips'             " snippet binds
    Plug 'tpope/vim-fugitive'           " git information and commands
    Plug 'vim-airline/vim-airline'      " fancy status bar

    " small features
    Plug 'airblade/vim-gitgutter'       " gitlens for vim
    Plug 'airblade/vim-rooter'          " always change cwd to git root
    Plug 'ervandew/supertab'            " tab based completion selection
    Plug 'takac/vim-hardtime'           " prevent
    Plug 'tpope/vim-commentary'         " comment out lines with gc + operator
    Plug 'tpope/vim-obsession'          " magic session management
    Plug 'tpope/vim-repeat'             " allow repeating plugin
    Plug 'tpope/vim-sleuth'             " auto-adjust tab behavior based on open file
    Plug 'tpope/vim-surround'           " surrounding character interactions on c
    Plug 'tpope/vim-unimpaired'         " useful paired binds around []

    " dependencies
    if !has('nvim')
      Plug 'roxma/nvim-yarp'            " deoplete
      Plug 'roxma/vim-hug-neovim-rpc'
    endif

    " filetype
    if g:plugin_development
      Plug 'gregdan3/lilyvim', {'for': ['ly', 'lilypond']}
    endif
    Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['md', 'markdown']}
    Plug 'lervag/vimtex', {'for': ['tex', 'plaintex']}
    Plug 'vimwiki/vimwiki'              " 'for' breaks loading, this is 'md'
    Plug 'michal-h21/vimwiki-sync'
call plug#end()

let g:ale_completion_enabled = 1
let g:ale_completion_autoimport = 1
let g:ale_lint_delay = 500
let g:ale_completion_delay = 0
let g:ale_fix_on_save = 1
let g:ale_set_balloons = 1
let g:ale_echo_msg_info_str = '🛈 '
let g:ale_echo_msg_warning_str = '⚠ '
let g:ale_echo_msg_error_str = '❌'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_linters = {
                \   'c': ['cc', 'clangtidy', 'clangd'],
                \   'cpp': ['cc', 'clangtidy', 'clangd'],
                \   'css': ['stylelint', 'prettier'],
                \   'dockerfile': ['hadolint'],
                \   'html': ['prettier', 'tidy'],
                \   'java': ['javac', 'eclipselsp'],
                \   'javascript': ['eslint', 'tsserver'],
                \   'json': ['jsonlint'],
                \   'markdown': ['alex', 'writegood', 'textlint'],
                \   'python': ['bandit', 'flake8', 'pyls', 'pyright'],
                \   'rust': ['cargo', 'rls'],
                \   'sh': ['shell', 'shellcheck', 'language_server'],
                \   'sql': ['sqlint', 'sql-language-server'],
                \   'vim': ['vint', 'vimls'],
                \   'yaml': ['yamllint'],
                \   }
let g:ale_fixers =  {
                \   '*': ['remove_trailing_lines', 'trim_whitespace'],
                \   'c': ['clang-format'],
                \   'cpp': ['clang-format'],
                \   'css': ['prettier'],
                \   'dockerfile': [],
                \   'html': ['prettier'],
                \   'java': ['google_java_format'],
                \   'javascript': ['eslint', 'prettier'],
                \   'json': ['prettier'],
                \   'markdown': ['prettier'],
                \   'python': ['isort', 'black'],
                \   'rust': ['rustfmt'],
                \   'sh': ['shfmt'],
                \   'sql': ['pgformatter'],
                \   'vim': ['remove_trailing_lines', 'trim_whitespace'],
                \   'yaml': ['prettier'],
                \   }
command! ALEToggleFixer execute "let g:ale_fix_on_save = get(g:, 'ale_fix_on_save', 0) ? 0 : 1"
if !has('nvim')
  highlight ALEWarning cterm=underline ctermul=blue ctermbg=none
  highlight ALEError   cterm=underline ctermul=red  ctermbg=none
else
  " TODO
endif
nnoremap <silent> <C-k> <Plug>(ale_previous_wrap)
nnoremap <silent> <C-j> <Plug>(ale_next_wrap)

" airline config
if !exists('g:airline_symbols') | let g:airline_symbols = {} | endif
let g:airline_powerline_fonts = 1
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.crypt = '🔐'
let g:airline_symbols.readonly = '🔒'
let g:airline_symbols.linenr = ' '
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.colnr = ':'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.spell = '✓'
let g:airline_symbols.dirty='*'
let g:airline_symbols.notexists = 'Ɇ'
let g:airline#extensions#branch#displayed_head_limit = 16   " limit branch names to first 16 chars
let g:airline#extensions#tabline#enabled = 1                " display open buffers+tabs on top bar
let g:airline#extensions#tabline#fnamecollapse = 2          " only show 2 trunc'd parent dirs
let g:airline#extensions#tabline#nametruncate = 16          " max buffer name of 16 chars
let g:airline#extensions#tabline#buffer_idx_mode = 1        " show buffer index  on tabline
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
nmap <leader>- <Plug>AirlineSelectPrevTab
nmap <leader>+ <Plug>AirlineSelectNextTab

call deoplete#custom#option('sources', { '_': ['ale', 'ultisnips'], })
let g:deoplete#enable_at_startup = 1

let g:EasyMotion_smartcase = 1
let g:EasyMotion_startofline = 0
nmap s <Plug>(easymotion-prefix)
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)
map sh <Plug>(easymotion-linebackward)
map sl <Plug>(easymotion-lineforward)
map s2 <Plug>(easymotion-s2)

let g:fzf_layout = { 'down': '~20%' }   " shrink default fzf window
let g:fzf_command_prefix = 'Fzf'        " fzf namespace

function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let preview_type = a:fullscreen ? 'up:60%' : 'right:50%:hidden'
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command, '--preview-window', preview_type]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction
command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)
function! s:list_cmd()
  let base = fnamemodify(expand('%'), ':h:.:S')
  return base ==# '.' ? 'fd --type file --follow' : printf('fd --type file --follow | proximity-sort %s', shellescape(expand('%')))
endfunction

command! -bang -nargs=? -complete=dir FzfFiles
  \ call fzf#vim#files(<q-args>, {'source': s:list_cmd(),
  \                               'options': '--tiebreak=index'}, <bang>0)

noremap <leader>s :RG
nnoremap <silent> <leader>o :FzfFiles<CR>
nnoremap <silent> <leader>O :FzfFiles!<CR>
nnoremap <silent> <leader>b :FzfBuffers<CR>
nnoremap <silent> <leader>` :FzfMarks<CR>
inoremap <silent> <F3> <ESC>:FzfSnippets<CR>

nnoremap <silent> <C-g> :G commit<CR>
nnoremap <silent> <C-d> :Gvdiffsplit<CR>

let g:hardtime_allow_different_key = 1
let g:list_of_disabled_keys = ['<UP>', '<DOWN>', '<LEFT>', '<RIGHT>', '<PAGEUP>', '<PAGEDOWN>']

let g:slime_target = 'vimterminal'                  " session to send to
let g:slime_paste_file = '$HOME/.vim/.slime_paste'  " cleaner selection for paste file
let g:slime_python_ipython = 1                      " ipython drops inputs without this

let g:SuperTabDefaultCompletionType = '<c-n>'       " select from top down

let g:UltiSnipsEditSplit='vertical'
let g:UltiSnipsJumpBackwardTrigger='<s-tab>'
let g:UltiSnipsJumpForwardTrigger='<tab>'
let g:UltiSnipsExpandTrigger='<NUL>'
" https://github.com/SirVer/ultisnips/issues/376
let g:ulti_expand_or_jump_res = 0
function ExpandSnippetOrCarriageReturn()
  let snippet = UltiSnips#ExpandSnippetOrJump()
  if g:ulti_expand_or_jump_res > 0 | return snippet | else | return "\<CR>" | endif
endfunction
inoremap <expr> <CR> pumvisible() ? "<C-R>=ExpandSnippetOrCarriageReturn()<CR>" : "\<CR>"

" filetype configuration
let g:mkdp_browser = 'firefox'
let g:tex_conceal='abdmg'
let g:tex_flavor = 'latex'
let g:vimtex_enable = 'true'
let g:vimtex_compiler_progname = 'tectonic'
let g:vimtex_view_general_viewer = 'zathura'
let g:vimtex_view_method = 'zathura'
let g:vimwiki_list = [{'path': '~/.vimwiki', 'path_html': '~/public_html'}]
