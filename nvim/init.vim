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

" ------
" PLUGINS
" ------

call plug#begin('~/.vim/plugged')
" Telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'

" LSP
Plug 'neovim/nvim-lspconfig'
Plug 'jose-elias-alvarez/nvim-lsp-ts-utils'
Plug 'hrsh7th/nvim-compe'
" Plug 'nvim-lua/completion-nvim'

" Git
Plug 'lewis6991/gitsigns.nvim'
Plug 'ThePrimeagen/git-worktree.nvim'
Plug 'tpope/vim-fugitive'

" Language
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'windwp/nvim-ts-autotag'

" Snippets
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'

" Terminal
Plug 'akinsho/nvim-toggleterm.lua'

" Statusline
Plug 'hoob3rt/lualine.nvim'

" Themes
Plug 'gruvbox-community/gruvbox'
Plug 'ayu-theme/ayu-vim'

" Rust
Plug 'rust-lang/rust.vim'
Plug 'simrat39/rust-tools.nvim'

" Database
Plug 'tpope/vim-dadbod'
Plug 'kristijanhusak/vim-dadbod-ui'
Plug 'kristijanhusak/vim-dadbod-completion'

Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'szw/vim-maximizer'
" Plug 'tpope/vim-obsession'
" Plug 'puremourning/vimspector'
" Plug 'jiangmiao/auto-pairs'

call plug#end()

lua << EOF
require'lualine'.setup{
  options = {
    theme = 'gruvbox',
    section_separators = {''},
    component_separators = {'|'},
    icons_enabled = false
  }
}

require'telescope'.setup{
  defaults = {
    file_ignore_patterns = { 'node_modules', 'tmp', 'dist', 'build' }
  },
}

require'telescope'.load_extension('fzy_native')
require'telescope'.load_extension('git_worktree')

require'git-worktree'.setup{}
require'gitsigns'.setup{
  signs = {
    add = { hl = 'GitSignsAdd', text = '+', numhl='GitSignsAddNr', linehl='GitSignsAddLn' },
    change = { hl = 'GitSignsChange', text = '~', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn' },
  },
}

require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
  },
}

require'nvim-ts-autotag'.setup{}

require"toggleterm".setup{
  open_mapping = [[<c-\>]],
}

-- nvim_lsp object
local nvim_lsp = require'lspconfig'

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- function to attach completion when setting up lsp
-- local on_attach = function(client, bufnr)
--   require'completion'.on_attach(client)
-- end

nvim_lsp.tsserver.setup({ on_attach = function(client)
  local ts_utils = require("nvim-lsp-ts-utils")

  -- defaults
  ts_utils.setup {
    disable_commands = false,
    enable_import_on_completion = true,
    import_on_completion_timeout = 0,

    -- eslint
    eslint_bin = "eslint_d",
    eslint_args = {"--cache", "-f", "json", "--stdin", "--stdin-filename", "$FILENAME"},
    eslint_enable_disable_comments = true,

    -- experimental settings!
    -- eslint diagnostics
    eslint_enable_diagnostics = true,
    eslint_diagnostics_debounce = 500,

    -- formatting
    enable_formatting = true,
    formatter = "prettier_d_slim",
    formatter_args = {"--stdin", "--stdin-filepath", "$FILENAME"},
    format_on_save = true
  }

  -- ts_utils.setup_client(client)

  vim.lsp.buf_request = ts_utils.buf_request
end})

-- nvim_lsp.vuels.setup({ on_attach = on_attach })

nvim_lsp.rust_analyzer.setup({
  -- on_attach = on_attach,
  capabilities = capabilities
})

nvim_lsp.vimls.setup{}

nvim_lsp.jsonls.setup{}

EOF
let g:compe = {}
let g:compe.enabled = v:true
let g:compe.autocomplete = v:true
let g:compe.debug = v:false
let g:compe.min_length = 1
let g:compe.preselect = 'enable'
let g:compe.throttle_time = 80
let g:compe.source_timeout = 200
let g:compe.incomplete_delay = 400
let g:compe.max_abbr_width = 100
let g:compe.max_kind_width = 100
let g:compe.max_menu_width = 100
let g:compe.documentation = v:true

let g:compe.source = {}
let g:compe.source.path = v:true
let g:compe.source.buffer = v:true
let g:compe.source.calc = v:true
let g:compe.source.nvim_lsp = v:true
let g:compe.source.nvim_lua = v:true
let g:compe.source.vsnip = v:true
let g:compe.source.vim_dadbod_completion = v:true

" set completeopt=menuone,noinsert,noselect
" For nvim-compe
set completeopt=menuone,noselect
" let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
" let g:completion_trigger_keyword_length = 3

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

" Database
let g:db_ui_save_location = '~/.config/db/queries'

" Telescope
nnoremap <leader>fw :lua require('telescope.builtin').grep_string({ search = '', only_short_text = true })<cr>
nnoremap <leader>ff :lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fb :lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>gd :lua require('telescope.builtin').lsp_definitions()<cr>
nnoremap <leader>ca :lua require('telescope.builtin').lsp_code_actions()<cr>
nnoremap <leader>fr :lua require('telescope.builtin').lsp_references()<cr>
nnoremap <leader>sh :lua vim.lsp.buf.hover()<cr>
nnoremap <leader>sd :lua vim.lsp.diagnostic.show_line_diagnostics()<cr>
nnoremap <leader>rs :lua vim.lsp.buf.rename()<cr>

" Typescript
nnoremap <leader>ia :TSLspImportAll<cr> :TSLspFormat<cr>
nnoremap <leader>io :TSLspOrganizeSync<cr> :TSLspFormat<cr>
nnoremap <leader>fc :TSLspFixCurrent<cr>

" Completition
inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <CR>      compe#confirm('<CR>')

" Git Worktree
nnoremap <leader>gw :lua require('telescope').extensions.git_worktree.git_worktrees()<cr>
command Blame lua require'gitsigns'.blame_line()

" Vim files
nnoremap <leader>ve :e ~/.config/nvim/init.vim<cr>
nnoremap <leader>vs :so ~/.config/nvim/init.vim<cr>

" Open last file
nnoremap <leader><leader> :e#<cr>
nnoremap <leader>t :set nosplitright <bar> :wincmd v<bar> :Ex <bar> :vertical resize 30<cr>

" Maximize window
nnoremap <leader>wm :MaximizerToggle<cr>

" Debug
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
" imap <silent> <c-space> <Plug>(completion_trigger)

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

" Snippets
imap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)' : '<C-j>'

" Jump forward or backward
imap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)' : '<Tab>'
smap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)' : '<Tab>'
imap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)' : '<S-Tab>'
smap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)' : '<S-Tab>'

" Indent after {
" inoremap {<CR> {<CR>}<C-o>O

" :W sudo saves the file
" (useful for handling the permission-denied error)
command W w !sudo tee % > /dev/null

augroup RIBEIRO
  autocmd!
  autocmd BufRead *.vue setfiletype html
  autocmd BufWritePre * %s/\s\+$//e
  " autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html Prettier
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

command CreateFile call CreateFile()

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

command DeleteFile call DeleteFile()

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

command RenameFile call RenameFile()

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
  execute 'e' new_filename
endfunction

command DuplicateFile call DuplicateFile()

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
