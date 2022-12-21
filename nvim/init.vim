call plug#begin('~/.vim/plugged')

" Vim
Plug 'mbbill/undotree'

" Telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'

Plug 'ThePrimeagen/harpoon'

" LSP
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'

" UI
Plug 'stevearc/dressing.nvim'

" Completition
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'
Plug 'hrsh7th/cmp-vsnip'

" Plug 'quangnguyen30192/cmp-nvim-ultisnips'

" Plug 'ruanyl/vim-sort-imports'
Plug 'pantharshit00/vim-prisma'
Plug 'onsails/diaglist.nvim'

" Git
Plug 'lewis6991/gitsigns.nvim'
Plug 'tpope/vim-fugitive'
Plug 'akinsho/git-conflict.nvim'
Plug 'ThePrimeagen/git-worktree.nvim'

" Language
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'windwp/nvim-ts-autotag'
Plug 'mhartington/formatter.nvim'
Plug 'findango/vim-mdx'
Plug 'edgedb/edgedb-vim'
Plug 'jose-elias-alvarez/typescript.nvim'
Plug 'folke/trouble.nvim'

" Snippets
" Plug 'SirVer/ultisnips'

" Statusline
Plug 'hoob3rt/lualine.nvim'

" Themes
"Plug 'ellisonleao/gruvbox.nvim'
Plug 'rafamadriz/themes.nvim'
"Plug 'gruvbox-community/gruvbox'
Plug 'luisiacc/gruvbox-baby'

" Rust
Plug 'rust-lang/rust.vim'
Plug 'simrat39/rust-tools.nvim'

Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-abolish'
Plug 'szw/vim-maximizer'

call plug#end()

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
set scrolloff=10
set sidescrolloff=20
set noshowmode
" set completeopt=menuone,noinsert,noselect
set colorcolumn=80
set signcolumn=yes

" Only show statusline when there is more than 1 window
set laststatus=1

" Give more space for displaying messages.
set cmdheight=1

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

set completeopt=menu,menuone,noselect
set background=dark
colorscheme tokyodark

let $BASH_ENV = "~/.bashrc"

let mapleader=" "

let g:gruvbox_contrast_dark = 'hard'

" Rust Format
let g:rustfmt_autosave = 1

let g:netrw_winsize = 20
let g:netrw_banner = 0
let g:netrw_keepdir = 1

let g:UltiSnipsSnippetDirectories=["UltiSnips", "ribeirosnippets"]
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

lua << EOF
-- vim.opt.statusline = [[%!luaeval("require('modules.ui.statusline').status_line()")]]

-- require'sort-import'.setup{}


require('dressing').setup({
  input = {
    insert_only = false
  }
})

require('git-conflict').setup()

vim.api.nvim_create_autocmd('User', {
  pattern = 'GitConflictDetected',
  callback = function()
    vim.notify('Conflict detected in '..vim.fn.expand('<afile>'))
    vim.keymap.set('n', 'cww', function()
      engage.conflict_buster()
    end)
  end
})

require("diaglist").init({
  debug = false,
  debounce_ms = 150,
})

require'lualine'.setup({
  options = {
    theme = 'iceberg_dark',
    section_separators = {''},
    section_separators = { left = '', right = ''},
    component_separators = {left = '', right = ''},
    icons_enabled = false,
    globalstatus = true,
  },
})

require'telescope'.setup({
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
})

require('telescope').load_extension('fzy_native')
require('telescope').load_extension('harpoon')
require('telescope').load_extension('git_worktree')

require('harpoon').setup({
  global_settings = {
    mark_branch = true,
  }
})

local prettier = function()
  return {
    -- exe = "prettier_d_slim",
    exe = "npx prettier",
--    args = {"--stdin", "--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0))},
    args = { "--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0))},
    stdin = true,
  }
end

local prismaFormatter = function()
return {
  exe = "npx prettier",
  args = { "--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0))},
  stdin = true,
  }
end

local tsFormatter = function()
  -- require('typescript').actions.removeUnused()

  return prettier()
end

require'formatter'.setup({
  filetype = {
    typescriptreact = {tsFormatter},
    typescript = {tsFormatter},
    javascriptreact = {tsFormatter},
    javascript = {tsFormatter},
    json = {prettier},
    scss = {prettier},
    css = {prettier},
    html = {prettier},
    prisma = {prettier},
  }
})


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

  if server.name == "tailwindcss" then
    return
  end

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

nvim_lsp.prismals.setup{}
nvim_lsp.tailwindcss.setup{}

local cmp = require'cmp'

cmp.setup({
  completion = {
    autocomplete = false,
  },
  snippet = {
    expand = function(args)
      -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
    end,
  },
  enabled = function()
    return vim.fn.reg_recording() == ''
  end,
  mapping = {
    ["<C-p>"] = cmp.mapping.select_prev_item(),
    ["<C-n>"] = cmp.mapping.select_next_item(),
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
    ['<Tab>'] = cmp.mapping.confirm({
      select = true
    }),
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    -- { name = 'ultisnips' }
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

require("trouble").setup({
  icons = false,
  fold_open = "v", -- icon used for open folds
  fold_closed = ">", -- icon used for closed folds
  indent_lines = false, -- add an indent guide below the fold icons
  auto_open = false,
  auto_close = true,
  signs = {
    -- icons / text used for a diagnostic
    error = "error",
    warning = "warn",
    hint = "hint",
    information = "info"
  },
  use_diagnostic_signs = false -- enabling this will use the signs defined in your lsp client
})

EOF

inoremap <Esc> <C-c>

" Telescope
nnoremap <leader>fw :lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fg :lua require('telescope.builtin').git_files({ show_untracked = true })<cr>
nnoremap <leader>ff :lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fb :lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fp :lua require('telescope').extensions.git_worktree.git_worktrees()<cr>

" LSP
nnoremap gd :lua vim.lsp.buf.definition()<cr>
nnoremap gD :lua vim.lsp.buf.declaration()<cr>
nnoremap gi :lua vim.lsp.buf.implementation()<cr>
nnoremap gr :lua vim.lsp.buf.references()<cr>
nnoremap K :lua vim.lsp.buf.hover()<cr>
nnoremap <C-K> :lua vim.lsp.buf.signature_help()<cr>
nnoremap <leader>ca :lua vim.lsp.buf.code_action()<cr>
nnoremap <leader>fs :lua vim.lsp.buf.document_symbols()<cr>
nnoremap <leader>rs :lua vim.lsp.buf.rename()<cr>

" Diagnostic
nnoremap <leader>e :lua vim.diagnostic.open_float()<cr>
nnoremap [d :lua vim.diagnostic.goto_prev()<cr>
nnoremap ]d :lua vim.diagnostic.goto_next()<cr>


" Harpoon
nnoremap <leader>ma :lua require('harpoon.mark').add_file()<cr>
nnoremap <leader>ms :lua require('harpoon.ui').toggle_quick_menu()<cr>
nnoremap <leader>1 :lua require('harpoon.ui').nav_file(1)<cr>
nnoremap <leader>2 :lua require('harpoon.ui').nav_file(2)<cr>
nnoremap <leader>3 :lua require('harpoon.ui').nav_file(3)<cr>
nnoremap <leader>4 :lua require('harpoon.ui').nav_file(4)<cr>
nnoremap <leader>5 :lua require('harpoon.ui').nav_file(5)<cr>
nnoremap <leader>6 :lua require('harpoon.ui').nav_file(6)<cr>
nnoremap <leader>7 :lua require('harpoon.ui').nav_file(7)<cr>
nnoremap <leader>8 :lua require('harpoon.ui').nav_file(8)<cr>
nnoremap <leader>9 :lua require('harpoon.ui').nav_file(9)<cr>

" Typescript
nnoremap <silent><leader>ia :lua require('typescript').actions.addMissingImports()<cr>
nnoremap <silent><leader>io :TSLspOrganizeSync<cr> :TSLspFormat<cr>
nnoremap <silent><leader>fc :TSLspFixCurrent<cr>
nnoremap <silent><leader>fu :lua require('typescript').actions.removeUnused()<cr>
nnoremap <silent><leader>ts :lua TsCheck()<cr>
nnoremap <silent><leader>do :TroubleToggle<cr>

" Vim files
nnoremap <leader>ve :e ~/.config/nvim/init.vim<cr>
nnoremap <leader>vs :so ~/.config/nvim/init.vim<cr>

" Open last file
nnoremap <leader><leader> :e#<cr>

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
"nnoremap <c-k> :m .-2<cr>==
"vnoremap <c-j> :m '>+1<cr>gv=gv
"vnoremap <c-k> :m '<-2<cr>gv=gv
"nnoremap <c-j> :m .+1<cr>==

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

" Buffer Navigation
nnoremap <leader>l :bn<cr>
nnoremap <leader>h :bp<cr>

" Vsnip

" Jump forward or backward
imap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
smap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
imap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
smap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'

command W w

augroup FormatAutogroup
  autocmd!
  " autocmd BufWritePost *.js,*.tsx,*.ts,*.css,*.scss,*.html,*.json silent! SortImport
  autocmd BufWritePost *.js,*.tsx,*.ts,*.css,*.scss,*.html,*.json,*.prisma FormatWrite
  autocmd BufWritePost *.sql lua RunQuery()
augroup END


augroup RIBEIRO
  autocmd!
  autocmd BufRead *.vue setfiletype html
  autocmd BufRead .env* setfiletype sh
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

function! Term()
  try
    call inputsave()
    let cmd = input('CMD: ')
    call inputrestore()

    if (cmd == '')
      return
    endif

    execute '10sp term://' . cmd
  finally
    echo ''
  endtry
endfunction

command Term call Term()

function! DeleteFile()
  let filename = expand('%')

  call inputsave()
  let option = input('Do you really want to delete this file? [y]es [n]o: ')
  call inputrestore()

  if (option == 'y')
    try
      :call system('rm -rf ' . filename)
      :bd
      :Cls
    catch
      :Cls
      echo 'Could not delete file'
    endtry
  endif
endfunction

command DeleteFile call DeleteFile()

function! Cls()
  call inputsave()
  call feedkeys(':','nx')
  call inputrestore()
endfunction

command Cls call Cls()

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
  -- local defaultCmd = 'npx tsc -p .'
  -- cmd = cmd or defaultCmd

  vim.fn.inputsave()
  local cmd = vim.fn.input('Comman: ', 'npx tsc -p .')
  vim.fn.inputrestore()

  local project_name = vim.fn.system('basename $(git rev-parse --show-toplevel)'):gsub("[\r\n]+", "")
  local filename = '/tmp/errors-' .. project_name .. '.txt'

  vim.cmd('cclose')

  vim.fn.system('rm -rf ' .. filename)
  vim.fn.system('touch ' .. filename)

  print(':Checking...')

  local errors = vim.fn.system(
    cmd .. ' | ' ..
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
      str = str .. line .. "\n"
    end

    ::continue::
  end

  file:write(str)
  file:close()

  if table.getn(lines) == 0 then
    print('No errors')
    return
  end

  vim.cmd('cf ' .. filename)
  vim.cmd('copen')
end

function CopyFile()
  local file_path = vim.fn.getreg('%') .. '/'
  local original_name = vim.fn.getreg('"')

vim.fn.inputsave()
local copy_name = vim.fn.input('Copy ' .. original_name .. ' to: ', original_name)
vim.fn.inputrestore()

local original_fullpath = file_path .. original_name
local copy_fullpath = file_path .. copy_name

local cmd = 'cp ' .. original_fullpath .. ' ' .. copy_fullpath

vim.fn.system(cmd)
vim.cmd('e ' .. copy_fullpath)
end
EOF

function! NetrwMappings()
  nmap <buffer> l <CR>:Lex<CR>
  nmap cp ^<C-V>$y:lua CopyFile()<CR>
endfunction

augroup netrw_mappings
  autocmd!
  autocmd filetype netrw call NetrwMappings()
augroup END

" Terminal
cabbrev term 20sp term://bash

nnoremap <leader>tt :Term<cr>

" Section: Line operations
"
" Insert line above/below in normal mode
function! s:Map(...) abort
  let [mode, head, rhs; rest] = a:000
  let flags = get(rest, 0, '') . (rhs =~# '^<Plug>' ? '' : '<script>')
  let tail = ''
  let keys = get(g:, mode.'remap', {})
  if type(keys) == type({}) && !empty(keys)
    while !empty(head) && len(keys)
      if has_key(keys, head)
        let head = keys[head]
        if empty(head)
          let head = '<skip>'
        endif
        break
      endif
      let tail = matchstr(head, '<[^<>]*>$\|.$') . tail
      let head = substitute(head, '<[^<>]*>$\|.$', '', '')
    endwhile
  endif
  if head !=# '<skip>' && empty(maparg(head.tail, mode))
    return mode.'map ' . flags . ' ' . head.tail . ' ' . rhs
  endif
  return ''
endfunction

function! s:BlankUp() abort
  let cmd = 'put!=repeat(nr2char(10), v:count1)|silent '']+'
  if &modifiable
    let cmd .= '|silent! call repeat#set("\<Plug>(unimpaired-blank-up)", v:count1)'
  endif
  return cmd
endfunction

function! s:BlankDown() abort
  let cmd = 'put =repeat(nr2char(10), v:count1)|silent ''[-'
  if &modifiable
    let cmd .= '|silent! call repeat#set("\<Plug>(unimpaired-blank-down)", v:count1)'
  endif
  return cmd
endfunction

nnoremap <silent> <Plug>(unimpaired-blank-up)   :<C-U>exe <SID>BlankUp()<CR>
nnoremap <silent> <Plug>(unimpaired-blank-down) :<C-U>exe <SID>BlankDown()<CR>

nnoremap <silent> <Plug>unimpairedBlankUp   :<C-U>exe <SID>BlankUp()<CR>
nnoremap <silent> <Plug>unimpairedBlankDown :<C-U>exe <SID>BlankDown()<CR>

exe s:Map('n', '<leader>o', '<Plug>(unimpaired-blank-down)')
exe s:Map('n', '<leader>O', '<Plug>(unimpaired-blank-up)')
