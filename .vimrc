" ---
" Plugins
" ---

call plug#begin('~/.vim/plugs')

Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'w0rp/ale'
Plug 'sheerun/vim-polyglot'
Plug 'prabirshrestha/vim-lsp'
Plug 'vim-syntastic/syntastic'
Plug 'Galooshi/vim-import-js'
Plug 'jiangmiao/auto-pairs'
Plug 'ruanyl/vim-sort-imports'
Plug 'prabirshrestha/async.vim'
Plug 'skywind3000/asyncrun.vim'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-flagship'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
" Sessions
Plug 'tpope/vim-obsession'
" Plug 'dhruvasagar/vim-prosession'
" Typescript
Plug 'Quramy/tsuquyomi'
" Themes
Plug 'rakr/vim-one'
Plug 'rafi/awesome-vim-colorschemes'
" Syntax
Plug 'pangloss/vim-javascript'
" Plug 'jelera/vim-javascript-syntax'
Plug 'othree/yajs.vim'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'peitalin/vim-jsx-typescript'
" Plug 'mxw/vim-jsx'
" Plug 'chemzqm/vim-jsx-improve'

call plug#end()

" ---
" General
" ---

" Sets how many lines of history VIM has to remember
set history=500

" Enable filetype plugins
filetype on
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

" Run Optimus build
command OB AsyncStop! | AsyncRun docker exec optimus_web yarn hot-reload

" Set the path for search files to to current path
set path=.,**

" nnoremap <leader>f :e `find . -type f -wholename **`<left><left>
nnoremap <leader>f :call FindFiles('(buffer)')<CR>
nnoremap <leader>t :tabe \| call FindFiles('(tab)')<CR>
" nnoremap <leader>t :tabe `find . -type f -wholename **`<left><left>
vnoremap <leader>f y:e `find . -type f -iname <C-R>"*`
" Open file with horizontal split
nnoremap <leader>s :sfind *
" Open file with vertical split
nnoremap <leader>v :vert sfind *
" Open file in a tab
" nnoremap <leader>t :tabfind *

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

" Select colorscheme
nnoremap <leader>c :colorscheme 

" Edit ~/.vimrc
nnoremap <leader>e :tabe ~/.vimrc<CR>

nnoremap <buffer> <C-D> mf<CR>

" Search selection
vnoremap // y/<C-R>"<CR>

" Enable auto sort import on write
" let g:import_sort_auto=1

" Open window for the asynrun command
let g:asyncrun_open=10

" TSU
" Rename symbol
nnoremap <F2> :TsuRenameSymbol<CR>
" See references
nnoremap <F12> :TsuReferences<CR>
" Import
nnoremap <NUL> :TsuImport<CR>
let g:tsuquyomi_definition_split=3

" Default dir to save sessions
let g:prosession_dir="~/.vim/sessions/"
let g:prosession_default_session=0

" ALE
" Go to next error
nnoremap <F8> :ALENext<CR>

" Open files from quickfix on new tab
set switchbuf+=usetab,newtab

" CURSOR
" Set IBeam cursor on insert mode, undeline in replace and block in normal
" let &t_SI = "\<Esc>[6 q"
" let &t_SR = "\<Esc>[4 q"
" let &t_EI = "\<Esc>[2 q"
autocmd InsertEnter,InsertLeave * set cul!


" ---
" VIM user interface
" ---

" Set 10 lines to the cursor - when moving vertically using j/k
set so=5

" Turn on the Wild menu
set wildmenu

set nowrap

" Search ignoring case
set wildignorecase

" Ignore files
set wildignore+=*.swp,*.bak
set wildignore+=*/.git/**/*,**/node_modules/**/*,*/dist/**/*,*/data/**/*,*/build/**/*
set wildignore+=*.o,*~,*.pyc
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store

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

" Completition menu
set completeopt=longest,menuone


" Show methods signature pop up
let g:tsuquyomi_completion_detail = 1 
let g:tsuquyomi_completion_preview = 1
let g:tsuquyomi_disable_quickfix = 1
let g:tsuquyomi_javascript_support = 1
let g:syntastic_typescript_checkers = ['tsuquyomi'] " You shouldn't use 'tsc' checker.

" Typescript hint
" set ballooneval
" autocmd FileType typescript setlocal balloonexpr=tsuquyomi#balloonexpr()

" Netrw tree view
let g:netrw_liststyle = 3

" Netrw ignore files
let g:netrw_list_hide = '.*\.swp$,.git/'
let g:netrw_keepdir = 1

" Highlight column at 80
set colorcolumn=80

inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Opens completition menu when pressing '.'
" inoremap <expr> . OpenCompletitionMenu()
func OpenCompletitionMenu()
  " Ignore if the line already ends with '.'
  echo getline('.')[col('.') - 1]
  if (getline('.')[col('.') - 2] =~ '\.$')
    return "\<Esc>a."
  endif

  if (&filetype ==# "typescript" || &filetype ==# "javascript")
    return pumvisible() ? "\<CR>.\<C-X>\<C-O>" : ".\<C-X>\<C-O>"
  endif

  return "."
endfunc


" ---
" Colors and Fonts
" ---

" Enable syntax highlighting
syntax enable

" Theme
set termguicolors
set background=dark
" colorscheme hybrid_reverse
colorscheme jellybeans
let g:two_firewatch_italics=1

" Enable 256 colors palette in Gnome Terminal;
set t_Co=256

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
set autoindent

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
let g:jsx_ext_required = 0

" let g:prettier#autoformat = 1 
let g:ale_fix_on_save = 0
let g:ale_fixers = {
\   'typescript': [
\       'tslint',
\   ],
\   'tsx': [
\       'tslint',
\   ],
\   'scss': [
\   ],
\   'json': [
\   ],
\}
let g:ale_sign_error = '●' " Less aggressive than the default '>>'
let g:ale_sign_warning = '»'
let g:ale_lint_on_enter = 1 " Less distracting when opening a new file


" ---
" Status line
" ---

" Always show the status line
set laststatus=2
set showtabline=2

au InsertEnter * call InsertStatuslineColor(v:insertmode)
au InsertLeave * hi statusline guifg=Gray30 guibg=Gray80

" Highligth the line on insert mode
" au InsertEnter * set cursorline
" au InsertLeave * set nocursorline
set cursorline

" Default color
hi statusline guifg=Gray30 guibg=Gray80

" Format the status line
set statusline=\ 
set statusline+=%t%m%r%h%w\ \ 
set statusline+=Line:\ %l\ 
set statusline+=Column:\ %c\ 
" Display [$] if the session is being recorded
" set statusline+=%=%{ObsessionStatus()}\ 

" Tabs
function! GetFilename(name)
  let filename=fnamemodify(a:name, ':t')
  " Remove "%)" at the end of the filename
  let filename = fnamemodify(filename, ':s?%(??')
  let filename = fnamemodify(filename, ':s?%)??')

  return filename
endfunction

let g:tablabel="%N%{flagship#tabmodified()}:\ %{GetFilename('%f')}"
set noautochdir

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
    autocmd BufWritePre *.ts,*.css,*.scss,*.tsx,*.js,*.json :Prettier
endif

" Switch buffers
nnoremap <leader>b :b#<CR>

" ---
" Helper functions
" ---


function! InlineJSON()
  :silent %s/\n//g | silent %s/\s\{2\}//g
endfunction

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

" Set the bgcolor to blue and text to white on insert mode
function! InsertStatuslineColor(mode)
  if a:mode == 'i'
    hi statusline guibg=SteelBlue4 guifg=Gray80
  endif
endfunction

" Find files and put on quickfix window
function! FindFiles(prefix)
  call inputsave()
  " Prompt for the filename to search
  let filename = input(a:prefix . " Filename: ", "", "file")
  call inputrestore()

  if empty(filename)
    return
  endif

  let dirs = [".git", "node_modules", "dist", "coverage"] 
  " Generate the command to ignore the directories above
  let ignore_dirs = "-not -path '*/" . join(dirs, "/*' -not -path '*/") . "/*'"
  let command = "find . -type f -iregex '.*" . filename . ".*' " . ignore_dirs . ' -printf "%p:1:1:%f\n" '

  " Call the find command and put the result on quickfix
  :cgete system(command)

  let files_count = len(getqflist())

  if files_count == 0
    echo ""
    echo "No files found for '" . filename . "'"
  elseif files_count == 1
    :cfirst
  else
    :copen
  endif
endfunction

function! CreateFile()
  let path = expand('%:h') . '/'

  try 
    call inputsave()
    let new_filename = input('Create file: ', path, 'file')
    call inputrestore()

    if (new_filename == '')
      return
    endif

    echo ''

    let folders = fnamemodify(new_filename, ':h')
    :silent call system('mkdir -p ' . folders)
    :silent call system('touch ' . new_filename)

    execute 'tabe' new_filename 
  finally
    echo ''
  endtry
endfunction

function! RenameFile()
  let filename = expand('%:t')
  let full_path = expand('%:p:h')
  let path = expand('%:h') . '/'

  try 
    call inputsave()
    let new_filename = input('Rename: ', filename)
    call inputrestore()

    if (new_filename == '')
      return
    endif

    echo '\r\r'
    let command = path . '{' . filename . ',' . new_filename . '}'
    echo system('mv ' . command)
    echo 'File renamed to ' . new_filename . '.\r\nFile reloaded'

    execute 'edit' path . new_filename 
  finally
    echo ''
  endtry
endfunction

function! DuplicateFile()
  let filename = expand('%')

  call inputsave()
  let new_filename = input('New filename: ', filename)
  call inputrestore()
  
  try
    let folders = fnamemodify(new_filename, ':h')
    :call system('stat a.js')
  catch
    :call system('mkdir -p ' . folders)
    :call system('touch ' . new_filename)
  endtry

  :call system('cat ' . filename . ' > ' . new_filename)
  execute 'tabe' new_filename
endfunction

function! DeleteFile()
  let filename = expand('%')

  call inputsave()
  let option = input('Do you really want to delete this file? [y]es [n]o: ')
  call inputrestore()

  if (option == 'y')
    try
      :call system('rm -rf ' . filename)
      :bd
      echo ''
      echo 'File deleted: ' . filename
    catch
      echo ''
      echo 'Could not delete file'
    endtry
  endif
endfunction
