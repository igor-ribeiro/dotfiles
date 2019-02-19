" ---
" Plugins
" ---

call plug#begin('~/.vim/plugs')

Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'w0rp/ale'
Plug 'sheerun/vim-polyglot'
Plug 'jiangmiao/auto-pairs'
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'Quramy/tsuquyomi'
Plug 'vim-syntastic/syntastic'
Plug 'rakr/vim-one'
Plug 'ayu-theme/ayu-vim'
Plug 'morhetz/gruvbox'
Plug 'Galooshi/vim-import-js'
Plug 'ruanyl/vim-sort-imports'

call plug#end()


" ---
" General
" ---

" Sets how many lines of history VIM has to remember
set history=500

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","

" :W sudo saves the file
" (useful for handling the permission-denied error)
command W w !sudo tee % > /dev/null

" Close all buffer and open the last one
command Bonly %bd|e#

" Set the path for search files to to current path
set path=.,**

" Search in project folder
nnoremap <leader>f :find *
vnoremap <leader>f y:e `find . -type f -name <C-R>"*`
" Open file with horizontal split
nnoremap <leader>s :sfind *
" Open file with vertical split
nnoremap <leader>v :vert sfind *
" Open file in a tab
nnoremap <leader>t :tabfind *

" Search in current folder
nnoremap <leader>F :find <C-R>=expand('%:h').'/*'<CR>
nnoremap <leader>S :sfind <C-R>=expand('%:h').'/*'<CR>
nnoremap <leader>V :vert sfind <C-R>=expand('%:h').'/*'<CR>
nnoremap <leader>T :tabfind <C-R>=expand('%:h').'/*'<CR>

" List buffers like commands
set wildcharm=<C-z>
nnoremap <leader>gb :buffer <C-z><S-Tab>
nnoremap <leader>gsb :sbuffer <C-z><S-Tab>

" Jump between buffers with pageup and pagedown
nnoremap <PageUp>   :bprevious<CR>
nnoremap <PageDown> :bnext<CR>

" Set the files and folders to ignore when searching
set wildignore=*.swp,*.bak
set wildignore+=*/.git/**/*,*/node_modules/**/*,*/dist/**/*,*/data/**/*

" Search ignoring case
set wildignorecase

" Select colorscheme
nnoremap <leader>c :colorscheme 

" Edit ~/.vimrc
nnoremap <leader>e :e ~/.vimrc<CR>

" Enable auto sort import on write
let g:import_sort_auto=1

" ---
" VIM user interface
" ---

" Set 10 lines to the cursor - when moving vertically using j/k
set so=10

" Turn on the Wild menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=.git\*,.hg\*,.svn\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif

"Always show current position
set ruler

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Clear highlighting for the current search with <Leader>/
" Adapted from https://stackoverflow.com/questions/657447/vim-clear-last-search-highlighting/657484#657484
nnoremap <Leader>/ :let @/=""<Return>

" Makes search act like search in modern browsers
set incsearch

" Show relative numbers
set relativenumber

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=

" Show methods signature pop up
let g:tsuquyomi_completion_detail = 0
let g:tsuquyomi_disable_quickfix = 1
let g:syntastic_typescript_checkers = ['tsuquyomi'] " You shouldn't use 'tsc' checker.

" Typescript hint
set ballooneval
autocmd FileType typescript setlocal balloonexpr=tsuquyomi#balloonexpr()

" Netrw tree view
let g:netrw_liststyle=3

" ---
" Colors and Fonts
" ---

" Enable syntax highlighting
syntax enable

" Theme
set termguicolors
set background=dark
colorscheme gruvbox

" Enable 256 colors palette in Gnome Terminal;
if $COLORTERM == 'gnome-terminal'
    set t_Co=256
endif

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac


" ---
" Files, backups and undo
" ---

" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile


" ---
" Text, tab and indent related
" ---

" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 2 spaces
set shiftwidth=2
set tabstop=2

" Enable yanking to the clipboard
" set clipboard=unnamedplus
set clipboard=unnamedplus

" Automatically indent pasted lines
nnoremap p p=`]
nnoremap P P=`]


" ---
" Visual mode related
" ---

" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>


" ---
" Syntax
" ---

" Allow JSX in .js files
let g:jsx_ext_required=0

let g:ale_fix_on_save=1
let g:ale_fixers = ['prettier', 'tslint', 'eslint']
let g:ale_sign_error = '●' " Less aggressive than the default '>>'
let g:ale_sign_warning = '.'
let g:ale_lint_on_enter = 0 " Less distracting when opening a new file


" ---
" Status line
" ---

" Always show the status line
set laststatus=2

" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ Line:\ %l\ \ Column:\ %c


" ---
" Editing mappings
" ---

" Remap VIM 0 to first non-blank character
map 0 ^

" Move a line of text using ALT+[jk] or Command+[jk] on mac
let c='a'
while c <= 'z'
  exec "set <A-".c.">=\e".c
  exec "imap \e".c." <A-".c.">"
  let c = nr2char(1+char2nr(c))
endw

set timeout ttimeoutlen=50

nnoremap <M-k> :m .-2<CR>==
vnoremap <M-j> :m '>+1<CR>gv=gv
vnoremap <M-k> :m '<-2<CR>gv=gv
nnoremap <M-j> :m .+1<CR>==


" Delete trailing white space on save, useful for some filetypes ;)
fun! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun

if has("autocmd")
    autocmd BufWritePre *.txt,*.js,*.py,*.wiki,*.sh,*.coffee :call CleanExtraSpaces()
endif

" ---
" Helper functions
" ---

" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
    let l:currentBufNum = bufnr("%")
    let l:alternateBufNum = bufnr("#")

    if buflisted(l:alternateBufNum)
        buffer #
    else
        bnext
    endif

    if bufnr("%") == l:currentBufNum
        new
    endif

    if buflisted(l:currentBufNum)
        execute("bdelete! ".l:currentBufNum)
    endif
endfunction

