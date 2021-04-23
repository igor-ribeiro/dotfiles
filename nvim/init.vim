" Auto sources .vimrc files inside project directories.
set exrc
" Cursor as block always.
set guicursor=
set relativenumber
" Show current line number.
set nu
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
set completeopt=menuone,noinsert,noselect
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

" ------
" PLUGINS
" ------

call plug#begin('~/.vim/plugged')
" Telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
" Plug 'tpope/vim-obsession'
Plug 'tpope/vim-commentary'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
" Plug 'puremourning/vimspector'
Plug 'szw/vim-maximizer'
" Plug 'jiangmiao/auto-pairs'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'ruanyl/vim-sort-imports'

" Statusline
Plug 'hoob3rt/lualine.nvim'

" Theme
Plug 'gruvbox-community/gruvbox'
Plug 'ayu-theme/ayu-vim'

" Rust
Plug 'rust-lang/rust.vim'

" Git Worktree
Plug 'ThePrimeagen/git-worktree.nvim'

call plug#end()


lua << EOF
require('lualine').setup{
  options = {
    theme = 'gruvbox',
    section_separators = {''},
    component_separators = {'|'},
    icons_enabled = false
  }
}

require('telescope').setup{
  defaults = {
    file_ignore_patterns = { 'node_modules', 'tmp', 'dist', 'build' }
  },
}

require('telescope').load_extension('fzy_native')
require('telescope').load_extension('git_worktree')

require'git-worktree'.setup{}

require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
  },
}

-- nvim_lsp object
local nvim_lsp = require'lspconfig'

-- function to attach completion when setting up lsp
local on_attach = function(client)
  require'completion'.on_attach(client)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

nvim_lsp.tsserver.setup({ on_attach = on_attach })

nvim_lsp.vuels.setup({ on_attach = on_attach })

nvim_lsp.rust_analyzer.setup({
  on_attach = on_attach,
  capabilities = capabilities
})

nvim_lsp.vimls.setup{}

nvim_lsp.jsonls.setup{}

EOF

set completeopt=menuone,noinsert,noselect
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
let g:completion_trigger_keyword_length = 3

" Prettier
let g:prettier#autoformat_config_present = 1
let g:prettier#autoformat_config_files = ['javascript', 'typescript', 'javascriptreact', 'typescriptreact', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html', 'svg']

" Vue
let g:vim_vue_plugin_use_scss = 1

colorscheme gruvbox
set background=dark

" Rust Format
let g:rustfmt_autosave = 1

let mapleader=" "

nnoremap <leader>fw :lua require('telescope.builtin').grep_string({ search = '', only_short_text = true })<cr>
nnoremap <leader>ff :lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fb :lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>gd :lua require('telescope.builtin').lsp_definitions()<cr>
" nnoremap <c-space> :lua vim.lsp.buf.code_action()<cr>
nnoremap <c-space> :lua require('telescope.builtin').lsp_code_actions()<cr>
" nnoremap <leader>r :lua vim.lsp.buf.references()<cr>
nnoremap <leader>fr :lua require('telescope.builtin').lsp_references()<cr>
nnoremap <leader>sh :lua vim.lsp.buf.hover()<cr>
nnoremap <leader>sd :lua vim.lsp.diagnostic.show_line_diagnostics()<cr>
nnoremap <F2> :lua vim.lsp.buf.rename()<cr>

" Git Worktree
nnoremap <leader>gw :lua require('telescope').extensions.git_worktree.git_worktrees()<cr>

nnoremap <leader>ve :e ~/.config/nvim/init.vim<cr>
nnoremap <leader>vs :so ~/.config/nvim/init.vim<cr>

nnoremap <leader><leader> :e#<cr>
nnoremap <leader>t :wincmd v<bar> :Ex <bar> :vertical resize 30<cr>
nnoremap <leader>wm :MaximizerToggle<cr>
nnoremap <leader>dd :call vimspector#Launch()<cr>
nnoremap <leader>dk :call vimspector#Reset()<cr>
nnoremap <leader>db :call vimspector#ToggleBreakpoint()<cr>
nnoremap <leader>dbk :call vimspector#ClearBreakpoints()<cr>
nnoremap <leader>dc :call vimspector#Continue()<cr>
nnoremap <leader><F8> :call vimspector#StepOver()<cr>
nnoremap <leader><F7> :call vimspector#RunToCursor()<cr>

" Delete buffer without closing window
nnoremap <leader>bk :bp\|bd #<cr>

" Rust
nnoremap <leader>rr :Cargo run<cr>G
nnoremap <leader>rt :Cargo test<cr>
nnoremap <leader>rb :Cargo build<cr>

" Trigger completion
imap <silent> <c-space> <Plug>(completion_trigger)


" Move lines up and down
nnoremap <m-k> :m .-2<cr>==
vnoremap <m-j> :m '>+1<cr>gv=gv
vnoremap <m-k> :m '<-2<cr>gv=gv
nnoremap <m-j> :m .+1<cr>==

" Automatically indent pasted lines
nnoremap p p=`]
nnoremap P P=`]

" Terminal
" Map ESC to leave insert mode
tnoremap <esc> <c-\><c-n>

" Indent after {
" inoremap {<CR> {<CR>}<C-o>O

" :W sudo saves the file
" (useful for handling the permission-denied error)
command W w !sudo tee % > /dev/null

augroup RIBEIRO
  autocmd!
  autocmd BufRead *.vue setfiletype html
  autocmd BufWritePre * %s/\s\+$//e
  autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html Prettier
  autocmd BufEnter * if &buftype == 'terminal' | :startinsert | endif
augroup END

function! CreateFile()
  let path = expand('%:h') . '/'

  try
    call inputsave()
    let filename = input('Filename: ', path)
    call inputrestore()

    if (filename == '')
      return
    endif

    execute 'edit' filename
  finally
    echo ''
  endtry
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
      echo '\r\r'
      echo 'File deleted: ' . filename
    catch
      echo '\r\r'
      echo 'Could not delete file'
    endtry
  endif
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

let s:clip = '/mnt/c/Windows/System32/clip.exe'
if executable(s:clip)
  augroup WSLYank
    autocmd!
    autocmd TextYankPost * if v:event.operator ==# 'y' | call system(s:clip, @0) | endif
  augroup END
endif

lua << EOF
function GitWorktreeAdd()
  vim.fn.inputsave()
  local branch = vim.fn.input('Branch: ')
  vim.fn.inputrestore()

  require("git-worktree").create_worktree(branch, branch)
end

function GitWorktreeDelete()
  vim.fn.inputsave()
  local branch = vim.fn.input('Branch: ')
  vim.fn.inputrestore()

  require("git-worktree").delete_worktree(branch)
end
EOF
