if &term =~ '^xterm'
" solid underscore
  let &t_SI .= "\<Esc>[4 q"
  " solid block
  let &t_EI .= "\<Esc>[2 q"
  " 1 or 0 -> blinking block
  " 3 -> blinking underscore
  " Recent versions of xterm (282 or above) also support
  " 5 -> blinking vertical bar
  " 6 -> solid vertical bar
endif

" Auto sources .vimrc files inside project directories.
set exrc
" Cursor as block always.
"set guicursor=
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
set nopaste

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
" Vim
Plug 'mbbill/undotree'

" Telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'

" LSP
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'

" Completition
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/cmp-vsnip'

Plug 'ruanyl/vim-sort-imports'
Plug 'pantharshit00/vim-prisma'
Plug 'onsails/diaglist.nvim'

" Git
Plug 'lewis6991/gitsigns.nvim'
Plug 'tpope/vim-fugitive'

" Language
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'windwp/nvim-ts-autotag'
Plug 'mhartington/formatter.nvim'
Plug 'findango/vim-mdx'

" Snippets
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'

" Terminal
"Plug 'akinsho/nvim-toggleterm.lua'

" Statusline
Plug 'hoob3rt/lualine.nvim'

" Themes
Plug 'gruvbox-community/gruvbox'

" Rust
Plug 'rust-lang/rust.vim'
Plug 'simrat39/rust-tools.nvim'

Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-abolish'
Plug 'szw/vim-maximizer'

call plug#end()

lua << EOF
-- require'sort-import'.setup{}


require("diaglist").init{
  -- optional settings
  -- below are defaults
  debug = false,

  -- increase for noisy servers
  debounce_ms = 150,
}

-- require'lualine'.setup{
--   options = {
--     theme = 'gruvbox',
--     section_separators = {''},
--     component_separators = {'|'},
--     icons_enabled = false
--   }
-- }

require'telescope'.setup{
  defaults = {
    file_ignore_patterns = { 'node_modules/', 'tmp/', 'dist/', 'build/' },
    mappings = {
      n = {
    	  ['<c-d>'] = require('telescope.actions').delete_buffer
      },
      i = {
        ['<c-d>'] = require('telescope.actions').delete_buffer
      }
    }
  },
}

local prettier = function()
  return {
    exe = "npx prettier",
    args = {"--stdin", "--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0))},
    stdin = true,
  }
end

require'formatter'.setup({
  filetype = {
    typescriptreact = {prettier},
    typescript = {prettier},
    javascriptreact = {prettier},
    javascript = {prettier},
    json = {prettier},
    scss = {prettier},
    css = {prettier},
    html = {prettier},
    prisma = {prettier},
  }
})

require'telescope'.load_extension('fzy_native')
-- require'telescope'.load_extension('git_worktree')

-- require'git-worktree'.setup{}
require'gitsigns'.setup{
  signs = {
    add = { hl = 'GitSignsAdd', text = '+', numhl='GitSignsAddNr', linehl='GitSignsAddLn' },
    change = { hl = 'GitSignsChange', text = '~', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn' },
  },
}

require'nvim-treesitter.configs'.setup{
  highlight = {
    enable = true,
  },
}

require'nvim-ts-autotag'.setup{}

-- nvim_lsp object
local nvim_lsp = require'lspconfig'

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

-- local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    -- virtual_text = false,
    -- signs = false,
    -- update_in_insert = false,
    underline = false,
    -- severity_sort = false,
  }
)

local lsp_installer = require("nvim-lsp-installer")

-- Register a handler that will be called for each installed server when it's ready (i.e. when installation is finished
-- or if the server is already installed).
lsp_installer.on_server_ready(function(server)
    local opts = {}

    if server.name == "cssls" then
        opts.capabilities = capabilities
    end

    if server.name == "rust_analyzer" then
      opts.capabilities = capabilities
    end

    -- This setup() function will take the provided server configuration and decorate it with the necessary properties
    -- before passing it onwards to lspconfig.
    -- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
    server:setup(opts)
end)

local cmp = require'cmp'

cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
    end,
  },
  mapping = {
    ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
    ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
    ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
    -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
    ['<C-y>'] = cmp.config.disable,
    ['<C-e>'] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),
    -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    ['<CR>'] = cmp.mapping.confirm({
      select = false
    }),
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'vsnip' }
  }, {
    { name = 'buffer' },
  })
})

cmp.setup.cmdline('/', {
  sources = {
    { name = 'buffer' }
    }
  })

-- cmp.setup.cmdline(':', {
--   sources = cmp.config.sources({
--     { name = 'path' }
--   }, {
--     { name = 'cmdline' }
--   })
-- })


-- require'sort-import'.setup();
-- require'sort-import'.sort_import();
EOF

set completeopt=menu,menuone,noselect

colorscheme gruvbox

let g:gruvbox_contrast_dark = 'hard'
set background=dark

" Rust Format
let g:rustfmt_autosave = 1

let mapleader=" "

" Database
"let g:db_ui_save_location = '~/.config/db/queries'

" Telescope
nnoremap <leader>fw :lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fg :lua require('telescope.builtin').git_files({ show_untracked = true })<cr>
nnoremap <leader>ff :lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fb :lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>gd :lua require('telescope.builtin').lsp_definitions()<cr>
nnoremap <leader>ca :lua require('telescope.builtin').lsp_code_actions()<cr>
nnoremap <leader>fr :lua require('telescope.builtin').lsp_references()<cr>
nnoremap <leader>fs :lua require('telescope.builtin').lsp_document_symbols()<cr>
nnoremap <leader>sh :lua vim.lsp.buf.hover()<cr>
nnoremap <leader>sd :lua vim.diagnostic.open_float()<cr>
nnoremap <leader>rs :lua vim.lsp.buf.rename()<cr>

" Typescript
nnoremap <silent><leader>ia :TSLspImportAll<cr> :TSLspFormat<cr>
nnoremap <silent><leader>io :TSLspOrganizeSync<cr> :TSLspFormat<cr>
nnoremap <silent><leader>fc :TSLspFixCurrent<cr>
nnoremap <silent><leader>ts :lua TsCheck()<cr>

" Git Worktree
nnoremap <leader>gw :lua require('telescope').extensions.git_worktree.git_worktrees()<cr>
command Blame lua require'gitsigns'.blame_line()

" Vim files
nnoremap <leader>ve :e ~/.config/nvim/init.vim<cr>
nnoremap <leader>vs :so ~/.config/nvim/init.vim<cr>

" Open last file
nnoremap <leader><leader> :e#<cr>
nnoremap <leader>tt :set nosplitright <bar> :wincmd v<bar> :Ex <bar> :vertical resize 30<cr>

" Maximize window
nnoremap <leader>wm :MaximizerToggle<cr>

" Debug
" nnoremap <leader>dd :call vimspector#Launch()<cr>
" nnoremap <leader>dk :call vimspector#Reset()<cr>
" nnoremap <leader>db :call vimspector#ToggleBreakpoint()<cr>
" nnoremap <leader>dbk :call vimspector#ClearBreakpoints()<cr>
" nnoremap <leader>dc :call vimspector#Continue()<cr>
nnoremap <leader><F8> :call vimspector#StepOver()<cr>
nnoremap <leader><F7> :call vimspector#RunToCursor()<cr>

" Quickfix
nnoremap <leader>cn :cn<cr>
nnoremap <leader>cp :cp<cr>

" Delete buffer without closing window
nnoremap <leader>bd :bp\|bd #<cr>

" Rust
nnoremap <leader>rr :Cargo run<cr>G
nnoremap <leader>rt :Cargo test<cr>
nnoremap <leader>rb :Cargo build<cr>

" Trigger completion
" imap <silent> <c-space> <Plug>(completion_trigger)

" Move lines up and down
nnoremap <c-k> :m .-2<cr>==
vnoremap <c-j> :m '>+1<cr>gv=gv
vnoremap <c-k> :m '<-2<cr>gv=gv
nnoremap <c-j> :m .+1<cr>==

" Automatically indent pasted lines
nnoremap p p=`]
nnoremap P P=`]

" Terminal
" Map ESC to leave insert mode
tnoremap <esc> <c-\><c-n>

" Yank line
nnoremap Y yy

" Netrw
nnoremap <leader>dd :Lex %:p:h<cr>
nnoremap <leader>de :Ex<cr>

let g:netrw_winsize = 20
let g:netrw_banner = 0

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


" Format on save
" augroup fmt
"   autocmd!
"   au BufWritePre * try | undojoin | Neoformat | catch /^Vim\%((\a\+)\)\=:E790/ | finally | silent Neoformat | endtry
" augroup END

augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost *.js,*.tsx,*.ts,*.css,*.scss,*.html,*.json silent! SortImport
  autocmd BufWritePost *.js,*.tsx,*.ts,*.css,*.scss,*.html,*.json,*.prisma FormatWrite
  autocmd BufWritePost *.sql lua RunQuery()
augroup END


augroup RIBEIRO
  autocmd!
  autocmd BufRead *.vue setfiletype html
  autocmd BufWritePre * %s/\s\+$//e
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

function! Pezzi()
  !npm run pezzi:extract-files
endfunction

command Pezzi call Pezzi()

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

function OpenJira()
  local branch = vim.fn.system('git branch | grep "*"'):gsub("* ", ""):gsub("(%a+)/", "")

  vim.fn.system('xdg-open https://trafilea.atlassian.net/browse/' .. branch)
end

function RunQuery()
  local file = vim.fn.expand("%")


  local result = vim.fn.system('psql postgresql://postgres:postgres@localhost:5432/postgres -f ' .. file)

  print(result)
end

function TsCheck()
  local project_name = vim.fn.system('basename $(git rev-parse --show-toplevel)'):gsub("[\r\n]+", "")
  local filename = '/tmp/errors-' .. project_name .. '.txt'

  vim.cmd('cclose')

  vim.fn.system('rm -rf ' .. filename)
  vim.fn.system('touch ' .. filename)

  print(':Checking...')

  local errors = vim.fn.system(
    'npx tsc -p . | ' ..
    'grep error | ' ..
    'sed -r "s/\\(/:/p" | ' ..
    'sed -r "s/,[[:digit:]]+\\)//p" | ' ..
    'sed -r "s/: error TS/: TS/p"'
  )

  local lines = {}
  local str = ''

  local file = io.open(filename, 'w+')

  for line in errors:gmatch("[^\r\n]+") do
    line_number = string.match(line, ':([0-9]+): ')

    if line_number == nil then
      goto continue
    end

    if lines[line_number] == nil then
      lines[line_number] = true
      -- print('adding', line_number, line)
      str = str .. line .. "\n"
    end

    ::continue::
  end

  file:write(str)
  file:close()

  -- if table.getn(lines) == 0 then
  --   print('No errors')
  --   return
  -- end

  vim.cmd('cf ' .. filename)
  vim.cmd('copen')
end
EOF

function! NetrwMappings()
  nmap <buffer> l <CR>:Lex<CR>
endfunction

augroup netrw_mappings
  autocmd!
  autocmd filetype netrw call NetrwMappings()
augroup END
