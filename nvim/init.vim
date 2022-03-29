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
" Plug 'hrsh7th/cmp-vsnip'
Plug 'quangnguyen30192/cmp-nvim-ultisnips'

" Plug 'ruanyl/vim-sort-imports'
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
Plug 'SirVer/ultisnips'

" Statusline
" Plug 'hoob3rt/lualine.nvim'

" Themes
Plug 'gruvbox-community/gruvbox'
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
set relativenumber
set relativenumber
set relativenumber
set relativenumber
set relativenumber
set relativenumber
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

set completeopt=menu,menuone,noselect
set background=dark
colorscheme gruvbox-baby

let mapleader=" "

let g:gruvbox_contrast_dark = 'hard'

" Rust Format
let g:rustfmt_autosave = 1

let g:netrw_winsize = 20
let g:netrw_banner = 0

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
    exe = "prettier_d_slim",
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
      vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
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
    { name = 'ultisnips' }
  }, {
    { name = 'buffer' },
  })
})

cmp.setup.cmdline('/', {
  sources = {
    { name = 'buffer' }
  }
})

EOF


" Telescope
nnoremap <leader>fw :lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fg :lua require('telescope.builtin').git_files({ show_untracked = true })<cr>
nnoremap <leader>ff :lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fb :lua require('telescope.builtin').buffers()<cr>
nnoremap gd :lua require('telescope.builtin').lsp_definitions()<cr>
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

command W w 

set relativenumber
set relativenumber
set relativenumber
set relativenumber
set relativenumber
