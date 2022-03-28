" Auto sources .vimrc files inside project directories.
set exrc
" Cursor as block always.
set guicursor=
" Show current line number.
set nu
set relativenumber
" Disable highlight after search.
set nohlsearch
" Keeps buffer opened in the background.
set hidden
set noerrorbells
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set smartindent
set nowrap
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set termguicolors
set t_Co=256
" Starts scrolling before reaching the end.
set scrolloff=8
set noshowmode
" set completeopt=menuone,noinsert,noselect
set colorcolumn=80
set signcolumn=yes

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000ms) leads to noticeable
" delays and poor UX.
set updatetime=50

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

set clipboard+=unnamedplus

" Vertical split opens on the right window.
set splitright
" Horizontal split opens below the window.
set splitbelow
