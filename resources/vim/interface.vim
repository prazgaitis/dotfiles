" Syntax highlighting
set t_Co=256
if has('syntax')
	syntax on
	colorscheme hybrid
endif

" Split in the correct direction
set splitbelow
set splitright

" Mouse support
if has('mouse')
	set mouse=a
	set mousehide
endif

" Goodbye, folding
set nofoldenable

" Restore previous cursor position
if has('autocmd')
	au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
endif

" Searching
set ignorecase    " Ignore case when searching...
set smartcase     " ...unless there are caps.
set incsearch     " Incremental search
set hlsearch      " Highlight matches
set gdefault      " Assume global search

" One space instead of two
set nojoinspaces

" Fix backspace on Windows
set backspace=2

" Undo level
set ul=1000

" Save undo history
if has('undodir')
	set undodir=~/.vim/backups
endif
if has('undofile')
	set undofile
endif

" Let us make our commands beautiful
set wildmenu
set wildmode=list:longest,full

" Timeout on multi-key stuff
set ttimeout
set ttimeoutlen=50

" Don't continue comments when newlining with O
set formatoptions-=o

" gvim
if has('gui_running')

	" Font
	set guifont=Source\ Code\ Pro:h14
	set antialias

	" Hide toolbar
	set guioptions-=T

	" Hide scrollbars on both sides
	set guioptions-=r
	set guioptions-=L

	" Cursor stuff
	highlight Cursor guifg=black guibg=grey
	set guicursor=n-c-v:block-Cursor-blinkon0
	set guicursor+=i:ver10-Cursor

	" Cursorline isn't slow on gvim
	set cursorline

endif

" Show line numbers
set number

" Show matching bracket when you hover on one
set showmatch

" Soft wrap by word
set wrap
set linebreak
set textwidth=0
set wrapmargin=0

" Scroll 4 lines away from margins
set scrolloff=4

" Tabs and EOLs should look like TextMate, but should be hidden by default
set nolist
set listchars=tab:▸\ ,eol:¬,trail:·,nbsp:·

" Open new buffers in new tabs
set switchbuf=usetab,newtab

" Make sure the line height is 1 line, not some other madness
set linespace=2

" Statusline
if has('statusline')
	set statusline=\ %F        " Filename + is modified
	set statusline+=\ %m       " Has the file been modified?
	set statusline+=\ %r       " Is the file read-only?
	set statusline+=\ %h       " Is this a help file?
	set statusline+=%=         " Separator
	set statusline+=%c,\       " What column number?
	set statusline+=%l/%L\     " How far into the file are we?
	set laststatus=1           " Show the statusline in 2+ windows
endif

" English language and no spellchecking by default
if has('spell')
	silent! language messages "en"
	set langmenu=none
	set spl=en spell
	set nospell
endif

" No error bells nor visual alerts
set noerrorbells
set visualbell t_vb=

" Return to normal mode when focus is lost
if has('autocmd')
	au FocusLost * call feedkeys("\<C-\>\<C-n>")
endif
