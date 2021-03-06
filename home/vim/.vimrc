" security

set secure
set nomodeline
set noexrc
if has('cryptv')
  if v:version > 704 || v:version == 704 && has('patch399')
    set cryptmethod=blowfish2
  elseif v:version >= 703
    set cryptmethod=blowfish
  endif
endif

" start vim-plug

try
  if has('nvim')
    call plug#begin("$XDG_CONFIG_HOME/nvim/plugged")
  else
    call plug#begin('~/.vim/plugged')
  endif
catch
endtry

" plugins

if exists(':Plug')
  Plug 'airblade/vim-gitgutter', { 'on': ['GitGutterEnable', 'GitGutterToggle'] }
  Plug 'ap/vim-css-color', { 'for': ['css', 'less', 'sass', 'scss', 'stylus', 'vim'] }
  Plug 'cocopon/iceberg.vim'
  Plug 'ctrlpvim/ctrlp.vim'
  Plug 'fatih/vim-go', { 'for': ['go'] }
  Plug 'henrik/vim-indexed-search'
  Plug 'jlanzarotta/bufexplorer', { 'on': ['BufExplorer', 'ToggleBufExplorer'] }
  Plug 'junegunn/goyo.vim', { 'on': 'Goyo' }
  Plug 'junegunn/rainbow_parentheses.vim', { 'for': ['lisp', 'clojure', 'scheme'] }
  Plug 'kopischke/vim-fetch'
  Plug 'kshenoy/vim-signature'
  Plug 'leafgarland/typescript-vim'
  Plug 'ntpeters/vim-better-whitespace'
  Plug 'rhysd/vim-crystal'
  Plug 'scrooloose/nerdtree', { 'on': ['NERDTree', 'NERDTreeClose', 'NERDTreeFocus', 'NERDTreeToggle', 'NERDTreeFind'] }
  Plug 'tomtom/tcomment_vim', { 'on': ['TComment'] }
  Plug 'tpope/vim-endwise', { 'for': ['lua', 'elixir', 'ruby', 'crystal', 'sh', 'zsh', 'vim', 'c', 'cpp', 'objc', 'xdefaults'] }
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-sensible'
  Plug 'tpope/vim-surround'
  Plug 'pangloss/vim-javascript'
  Plug 'maxmellon/vim-jsx-pretty'

  if has('nvim')
    let s:can_install_ale = has('timers')
  else
    let s:can_install_ale = has('timers') && exists('*job_start') && exists('*ch_close_in')
  endif
  if s:can_install_ale
    Plug 'w0rp/ale'
  endif

  if has('python')
    Plug 'Valloric/MatchTagAlways', { 'for': ['html', 'xhtml', 'xml', 'jinja'] }
  endif

  if has('mac')
    Plug 'sjl/vitality.vim'
    Plug 'rizzatti/dash.vim', { 'on': ['Dash', 'DashKeywords' ] }
  endif

  call plug#end()
endif

" disable built-in plugins

let g:loaded_2html_plugin = 1
let g:loaded_getscriptPlugin = 1
let g:loaded_gzip = 1
let g:loaded_logipat = 1
let g:loaded_rrhelper = 1
let g:loaded_tar = 1
let g:loaded_tarPlugin = 1
let g:loaded_zip = 1
let g:loaded_zipPlugin = 1

" syntax highlighting
"
colorscheme Tomorrow-Night
au FileType diff colorscheme desert
au FileType git colorscheme desert
au BufWinLeave * colorscheme Tomorrow-Night


syntax enable
set synmaxcol=200

" ui components

set ruler
set number
set nocursorcolumn
set nocursorline
set visualbell
set showcmd
set laststatus=2
set statusline=\ %f\ %*%<\ %m\ %=%l,\ %c\ %r
if !has('gui_running')
  set notitle
endif

" mouse

set mouse=

" editing ui

set listchars=tab:▸\ ,eol:¬,trail:·,nbsp:·
set nolist
set showmatch
set matchtime=2
set nofoldenable
set wrap
set linebreak
set showbreak=" "
set display=uhex

try
  set breakindent
catch /E518:/
  " Unknown option: breakindent
endtry

" scrolling

set scrolloff=4
set sidescroll=1
set sidescrolloff=15

" indenting

set shiftwidth=2
set tabstop=2
set softtabstop=2
set expandtab
set autoindent
set shiftround
set smartindent

" searching

set ignorecase
set smartcase
set incsearch
set hlsearch
set gdefault
set nowrapscan

" ctrl-a, ctrl-x

set nrformats=hex

" autoformatting

set formatoptions=tcqn
try  " because not all versions of Vim support this...
  set formatoptions+=j
catch
endtry
set nojoinspaces

" commands

set noconfirm

" splits

set splitbelow
set splitright

" undo

set undofile
set undodir=/tmp

" find a file

set path+=**

set wildmenu
set wildmode=full
set wildignorecase

set wildignore+=*.o,*.out,*.obj
set wildignore+=*.dll,*.exe
set wildignore+=*.pyc,*.pyo,__pycache__
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz,*.7z
set wildignore+=*.png,*.gif,*.jpg,*.jpeg,*.bmp,*.tiff
set wildignore+=*.swp
set wildignore+=.DS_Store

" no more backups

set nobackup
set nowritebackup

" autocomplete

set complete=.,w,b,u,t
set completeopt=menu,preview
au FileType
  \ if &omnifunc == "" |
  \   setlocal omnifunc=syntaxcomplete#Complete |
  \ endif

" :help should open things in new tabs

augroup helptabs
  autocmd!

  au FileType help wincmd T
augroup END

" remappings

let mapleader = "\<Space>"

nnoremap <expr> j v:count ? (v:count > 5 ? "m'" . v:count : '') . 'j' : 'gj'
nnoremap <expr> k v:count ? (v:count > 5 ? "m'" . v:count : '') . 'k' : 'gk'

nnoremap Y y$
nnoremap 0 ^
nnoremap H ^
nnoremap L $
nnoremap vv 0v$

nnoremap <expr> n 'Nn'[v:searchforward]
nnoremap <expr> N 'nN'[v:searchforward]

nnoremap <silent> <LEFT> :tabprevious<CR>
nnoremap <silent> <RIGHT> :tabnext<CR>

nmap <Leader><Leader> :noh<CR>:w<CR>
map <silent> <LocalLeader>cc :TComment<CR>
map <silent> <Leader>ff :CtrlPBuffer<CR>
nnoremap <Leader>k :NERDTreeToggle<CR>
nnoremap <Leader>f :NERDTreeFind<CR>
nnoremap <Leader>p :CtrlPBuffer<CR>
nnoremap - :BufExplorer<CR>

cnoremap W<CR> :w<CR>
cnoremap Wa<CR> :wa<CR>
cnoremap Q<CR> :q<CR>
cnoremap Qa<CR> :qa<CR>

nnoremap Q <nop>
nnoremap K <nop>
nnoremap ZZ <nop>
nnoremap ZQ <nop>

" spelling

if has('spell')
  set spelllang=en_us
endif

" autoread

set autoread
set updatetime=800

augroup autoread
  autocmd!
  autocmd CursorHold * silent! checktime
augroup END

" vimdiff options

set diffopt=filler,vertical

" languages

augroup languages
  autocmd!

  au BufNewFile,BufRead *.md set filetype=markdown
  au BufNewFile,BufRead *vimperatorrc,*.vimp set syn=vim
  au BufNewFile,BufRead *.ejs set filetype=html
  au BufNewFile,BufRead *.p8 set filetype=lua

  au FileType python setlocal colorcolumn=80
  au FileType css,scss setlocal iskeyword+=-
  au FileType gitcommit setlocal spell
  au FileType lisp,clojure,scheme RainbowParentheses
  au FileType clojure setlocal iskeyword-=/
augroup END

let g:crystal_define_mappings = 0

" netrw

let g:netrw_liststyle = 3
let g:netrw_banner = 0
let g:netrw_nogx = 1

" gitgutter

let g:gitgutter_map_keys = 0
let g:gitgutter_escape_grep = 1
let g:gitgutter_diff_args = '--ignore-space-at-eol'

" ctrlp

let g:ctrlp_user_command = {
  \ 'types': {
    \ 1: ['.git', 'cd %s && git ls-files --others --cached --exclude-standard'],
    \ 2: ['.hg', 'hg --cwd %s locate -I .'],
  \ },
  \ 'fallback': 'find %s -type f'
\ }
let g:ctrlp_match_window = 'top,order:btt'
let g:ctrlp_working_path_mode = 'r'
let g:ctrlp_use_caching = 1
let g:ctrlp_clear_cache_on_exit = 1
let g:ctrlp_lazy_update = 20

" nerdtree

let NERDTreeIgnore = ['\.DS_Store$', '^\.git$', '^\.vagrant$', '\.pyc$', '\~$', '\.o$']
let NERDTreeShowHidden = 1
let NERDTreeMinimalUI = 0
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeBookmarksFile = expand("$XDG_CACHE_HOME/NERDTreeBookmarks")

map <silent> <LocalLeader>nt :NERDTreeToggle<CR>
map <silent> <LocalLeader>nr :NERDTree<CR>
map <silent> <LocalLeader>nf :NERDTreeFind<CR>

" bufexplorer

let g:bufExplorerDisableDefaultKeyMapping = 1
let g:bufExplorerShowRelativePath = 1

" rainbow parens

let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['{', '}']]
let g:rainbow#blacklist = [203]

" tcomment

let g:tcommentMaps = 0

" ale

let g:ale_sign_error = '✗'
let g:ale_sign_warning = '∆'
let g:ale_fix_on_save = 1
let g:ale_warn_about_trailing_whitespace = 0

let g:ale_linters = {
      \'html': [],
      \'java': [],
      \'javascript': ['standard'],
      \'python': ['flake8'],
      \}

let g:ale_pattern_options = {
      \'\.min.js$': { 'ale_enabled': 0 },
      \'\.min.css$': { 'ale_enabled': 0 },
      \}

" strip whitespace on save

if exists(':StripWhitespace')
  augroup stripwhitespaceonsave
    autocmd!

    au BufWritePre * StripWhitespace
  augroup END
endif

" local vimrc

if filereadable(glob('~/.vimrc_local'))
  source ~/.vimrc_local
endif
