--[[

        ====================================================================
        ==================== READ THIS BEFORE CONTINUING ====================
        =====================================================================

        Kickstart.nvim is *not* a distribution.

        Kickstart.nvim is a template for your own configuration.
          The goal is that you can read every line of code, top-to-bottom, and understand
          what your configuration is doing.

          Once you've done that, you should start exploring, configuring and tinkering to
          explore Neovim!

          If you don't know anything about Lua, I recommend taking some time to read through
          a guide. One possible example:
          - https://learnxinyminutes.com/docs/lua/

          And then you can explore or search through `:help lua-guide`


        Kickstart Guide:

        I have left several `:help X` comments throughout the init.lua
        You should run that command and read that help section for more information.

        In addition, I have some `NOTE:` items throughout the file.
        These are for you, the reader to help understand what is happening. Feel free to delete
        them once you know what you're doing, but they should serve as a guide for when you
        are first encountering a few different constructs in your nvim config.

        I hope you enjoy your Neovim journey,
        - TJ

        P.S. You can delete this when you're done too. It's your config now :)
        --]]
--

-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.g.do_filetype_lua = true
vim.g.did_load_filetypes = false

-- local local_vimrc_file = vim.fn.getcwd() .. '/.vimrc'
--
-- if vim.fn.empty(local_vimrc_file) then
--   vim.cmd('source ' .. local_vimrc_file)
-- end

-- vim.cmd [[highlight IndentBlanklineIndent1 guifg=#333333 gui=nocombine]]

-- Install package manager
--    https://github.com/folke/lazy.nvim
--    `:help lazy.nvim.txt` for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

-- NOTE: Here is where you install your plugins.
--  You can configure plugins using the `config` key.
--
--  You can also configure plugins after the setup call,
--    as they will be available in your neovim runtime.
require('lazy').setup({
  -- NOTE: First, some plugins that don't require any configuration

  -- Undo
  'mbbill/undotree',

  -- Maximize windows
  {
    'szw/vim-maximizer',
    config = function(self, opts)
      vim.keymap.set('n', '<leader>wm', ':MaximizerToggle<cr>', { desc = '[W]indow [M]maximize' })
    end
  },

  -- Git related plugins
  'tpope/vim-fugitive',
  'tpope/vim-rhubarb',

  'tpope/vim-surround',

  -- Multi-cursor
  'mg979/vim-visual-multi',

  -- Multi-case substitution
  'tpope/vim-abolish',

  -- NOTE: This is where your plugins related to LSP can be installed.
  --  The configuration is done below. Search for lspconfig to find it below.
  {
    -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    dependencies = {
      -- Automatically install LSPs to stdpath for neovim
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',

      -- Useful status updates for LSP
      -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
      {
        'j-hui/fidget.nvim',
        tag = "legacy",
        event = "LspAttach",
        opts = {}
      },

      -- Additional lua configuration, makes nvim stuff amazing!
      'folke/neodev.nvim',
    },
  },

  {
    'https://git.sr.ht/~whynothugo/lsp_lines.nvim',
    enabled = false,
    config = function()
      require('lsp_lines').setup()
    end
  },

  {
    -- Autocompletion
    'hrsh7th/nvim-cmp',
    lazy = true,
    dependencies = { 'hrsh7th/cmp-nvim-lsp', 'L3MON4D3/LuaSnip', 'saadparwaiz1/cmp_luasnip' },
  },

  -- Useful plugin to show you pending keybinds.
  {
    'folke/which-key.nvim',
    opts = {
      plugins = {
        registers = false
      }
    }
  },
  {
    -- Adds git releated signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
    opts = {
      -- See `:help gitsigns.txt`
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
    },
  },

  {
    'cespare/vim-toml'
  },

  {
    -- Set lualine as statusline
    'nvim-lualine/lualine.nvim',
    -- See `:help lualine.txt`
    opts = {
      options = {
        icons_enabled = false,
        theme = 'auto',
        component_separators = '|',
        section_separators = '',
      },
    },
  },

  {
    -- Add indentation guides even on blank lines
    'lukas-reineke/indent-blankline.nvim',
    enable = false,
    main = "ibl",
    -- Enable `lukas-reineke/indent-blankline.nvim`
    -- See `:help indent_blankline.txt`
  },

  -- "gc" to comment visual regions/lines
  {
    'numToStr/Comment.nvim',
    opts = {}
  },

  -- Image preview
  {
    'edluffy/hologram.nvim',
    config = function()
      require('hologram').setup {
        auto_display = true -- WIP automatic markdown image display, may be prone to breaking
      }
    end
  },

  -- Fuzzy Finder (files, lsp, etc)
  {
    'nvim-telescope/telescope.nvim',
    version = '*',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local theme = require("telescope.themes").get_ivy({
        layout_config = { height = 20 },
        -- layout_strategy = "center"
      })

      local fb_actions = require "telescope".extensions.file_browser.actions

      require('telescope').setup {
        defaults = {
          dynamic_preview_title = true,
        },
        pickers = {
          find_files = theme,
          buffers = theme,
          oldfiles = theme,
          help_tags = theme,
          grep_string = theme,
          live_grep = theme,
          diagnostics = theme,
        },
        extensions = {
          file_browser = vim.tbl_deep_extend("force",
            {
              dir_icon = "",
              grouped = true,
              layout_config = { height = 50 },
              display_stat = false,
              initial_mode = "normal",
              hijack_netrw = false,
              previewer = false,
              mappings = {
                ["i"] = {
                  ["<bs>"] = false,
                },
                ["n"] = {
                  ["-"] = fb_actions.goto_parent_dir,
                },
              },
            },
            theme
          ),
        }
      }

      pcall(require('telescope').load_extension, 'fzf')
    end
  },

  -- Fuzzy Finder Algorithm which requires local dependencies to be built.
  -- Only load if `make` is available. Make sure you have the system
  -- requirements installed.
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    -- NOTE: If you are having trouble with this installation,
    --       refer to the README for telescope-fzf-native for more instructions.
    build = 'make',
    cond = function()
      return vim.fn.executable 'make' == 1
    end,
  },

  {
    -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
      'tjdevries/tree-sitter-rsx',
    },
    config = function()
      pcall(require('nvim-treesitter.install').update { with_sync = true })

      -- local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
      -- parser_config.rust = {
      --   install_info = {
      --     url = "https://github.com/tjdevries/tree-sitter-rsx", -- local path or git repo
      --     files = { "src/parser.c", "src/scanner.cc" },         -- note that some parsers also require src/scanner.c or src/scanner.cc
      --     -- optional entries:
      --     branch = "master",                                    -- default branch in case of git repo if different from master
      --     generate_requires_npm = true,                         -- if stand-alone parser without npm dependencies
      --     requires_generate_from_grammar = true,                -- if folder contains pre-generated src/parser.c
      --   },
      --   filetype = "rs",                                        -- if filetype does not match the parser name
      -- }
    end,
  },

  -- Themes
  {
    'sainnhe/gruvbox-material',
    enabled = false,
    config = function()
      vim.g.gruvbox_material_colors_override = {
        bg0 = { '#16191a', '234' }
      }
      -- vim.g.gruvbox_material_foreground  'mix'
      vim.g.gruvbox_material_better_performance = 1
      vim.g.gruvbox_material_enable_bold = 1
      vim.g.gruvbox_material_enable_italic = 1
      vim.cmd.colorscheme 'gruvbox-material'
    end
  },

  {
    -- Tsoding theme
    'blazkowolf/gruber-darker.nvim',
    config = function()
      vim.cmd.colorscheme 'gruber-darker'

      vim.api.nvim_set_hl(0, "String", { fg = "#84c75d" })
      vim.api.nvim_set_hl(0, "Comment", { fg = "#575956" })

      vim.api.nvim_set_hl(0, "GruberDarkerFg1", { fg = "#d9d9d9" })
      vim.api.nvim_set_hl(0, "GruberDarkerRed", { fg = "#e04d54" })
      vim.api.nvim_set_hl(0, "GruberDarkerRedBold", { link = 'GruberDarkerRed' })

      vim.api.nvim_set_hl(0, "GruberDarkerYellowBold", { fg = "#ebd35e", bold = true })
      vim.api.nvim_set_hl(0, "GruberDarkerYellow", { fg = "#ebd35e" })
      vim.api.nvim_set_hl(0, "Cursor", { reverse = true })
      vim.api.nvim_set_hl(0, "ColorColumn", { link = "StatusLine" })
      vim.api.nvim_set_hl(0, "CursorLine", { bg = "#282828" })
      vim.api.nvim_set_hl(0, "LineNr", { link = "GruberDarkerYellow" })
      vim.api.nvim_set_hl(0, "LineNrBelow", { link = "SignColumn" })
      vim.api.nvim_set_hl(0, "LineNrAbove", { link = "SignColumn" })

      vim.api.nvim_set_hl(0, "@include", { link = "GruberDarkerYellowBold" })
      vim.api.nvim_set_hl(0, "@property", { link = "GruberDarkerFg1" })
      vim.api.nvim_set_hl(0, "@property.json", { link = "GruberDarkerQuartz" })
      vim.api.nvim_set_hl(0, "@punctuation.bracket", { link = "GruberDarkerQuartz" })
      vim.api.nvim_set_hl(0, "@punctuation.special", { link = "GruberDarkerQuartz" })
      vim.api.nvim_set_hl(0, "@include.identifier", { link = "GruberDarkerQuartz" })
      vim.api.nvim_set_hl(0, "@tag", { link = "GruberDarkerQuartz" })
      vim.api.nvim_set_hl(0, "@tag.delimiter", { link = "GruberDarkerQuartz" })
      vim.api.nvim_set_hl(0, "@tag.attribute.tsx", { link = "GruberDarkerQuartz" })
      vim.api.nvim_set_hl(0, "@tag.builtin.tsx", { link = "GruberDarkerQuartz" })
      vim.api.nvim_set_hl(0, "@lsp.typemod.property.declaration", { link = "GruberDarkerQuartz" })
      -- vim.api.nvim_set_hl(0, "@tag.tsx", { link = "GruberDarkerNiagara" })
      vim.api.nvim_set_hl(0, "@number", { fg = "#b9aee8" })
      vim.api.nvim_set_hl(0, "@comment.todo", { fg = "#999884", bold = true })
      vim.api.nvim_set_hl(0, "@text.todo.unchecked", { link = "GruberDarkerYellow", bg = "None" })
    end
  },

  {
    'savq/melange-nvim',
    config = function()
      vim.opt.termguicolors = true
      -- vim.cmd.colorscheme 'melange'
    end
  },

  {
    'catppuccin/nvim',
    enabled = false,
    name = 'catppuccin',
    config = function()
      require('catppuccin').setup({
        flavour = 'macchiato',
        term_colors = true,
        transparent_background = true,
        dim_inactive = {
          enabled = true,
          shade = "dark",
          percentage = 0.1
        },
      })

      vim.cmd.colorscheme 'catppuccin'
    end,
  },

  {
    'tomasiser/vim-code-dark',
    enabled = false,
    config = function()
      vim.g.codedark_italics = 1
      vim.g.codedark_transparent = 1
      vim.cmd.colorscheme 'codedark'
    end
  },

  {
    'Mofiqul/vscode.nvim',
    enabled = false,
    config = function()
      vim.o.background = 'dark'
      local c = require('vscode.colors').get_colors()
      require('vscode').setup({
        -- Alternatively set style in setup
        -- style = 'light'

        -- Enable transparent background
        transparent = true,
        -- Enable italic comment
        italic_comments = true,
        -- Disable nvim-tree background color
        disable_nvimtree_bg = true,
        -- Override colors (see ./lua/vscode/colors.lua)
        color_overrides = {
          vscLineNumber = '#FFFFFF',
        },
        -- Override highlight groups (see ./lua/vscode/theme.lua)
        group_overrides = {
          -- this supports the same val table as vim.api.nvim_set_hl
          -- use colors from this colorscheme by requiring vscode.colors!
          Cursor = { fg = c.vscDarkBlue, bg = c.vscLightGreen, bold = true },
        }
      })
      require('vscode').load()
    end
  },

  {
    -- UI elements to enhance Telescope
    'stevearc/dressing.nvim',
    opts = {
      input = {
        insert_only = false
      }
    }
  },

  {
    -- Manage files shortcut
    'ThePrimeagen/harpoon',
    opts = {
      global_settings = {
        mark_branch = true,
      },
    },
    dependencies = { "nvim-telescope/telescope.nvim" },
    config = function()
      require("harpoon").setup({
        menu = {
          width = vim.api.nvim_win_get_width(0) - 10,
        }
      })

      require('telescope').load_extension('harpoon')
    end,
  },

  {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
    priority = 100,
    config = function()
      require("telescope").load_extension("file_browser")
    end
  },

  {
    -- Git Worktree
    'ThePrimeagen/git-worktree.nvim',
    opts = {
      change_directory_command = "cd",
      update_on_change = true,
      autopush = true,
    },
    config = function()
      require('telescope').load_extension('git_worktree')

      vim.keymap.set('n', '<leader>ow', require('telescope').extensions.git_worktree.git_worktrees,
        { desc = '[O]pen [W]orktrees' })
    end,
  },

  -- {
  --   -- Typescript utilities
  --   'jose-elias-alvarez/typescript.nvim',
  -- },

  {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    opts = {
      settings = {
        tsserver_file_preferences = {
          importModuleSpecifierPreference = "non-relative",
        }
      }
    },
  },

  {
    'igor-ribeiro/tsc.nvim',
    config = function()
      require('tsc').setup()
    end,
  },

  -- Rust
  {
    'rust-lang/rust.vim',
  },
  {
    'togglebyte/togglerust'
  },
  {
    'simrat39/rust-tools.nvim',
  },

  {
    'adnan007d/vim-prettier',
    build = 'npm install --frozen-lockfile --production'
  },

  {
    'mhartington/formatter.nvim',
    config = function()
      require('formatter').setup({
        logging = false,
        filetype = {
          ["*"] = {
            function()
              return {
                exe = "prettierd",
                args = { vim.api.nvim_buf_get_name(0) },
                stdin = true
              }
            end
          },
        }
      })
    end,
  },

  -- {
  --   'nathom/filetype.nvim',
  --   config = function()
  --     require('filetype').setup({
  --       overrides = {
  --         complex = {
  --           ['.env.*'] = 'sh',
  --         }
  --       }
  --     })
  --   end
  -- },

  -- NOTE: Next Step on Your Neovim Journey: Add/Configure additional "plugins" for kickstart
  --       These are some example plugins that I've included in the kickstart repository.
  --       Uncomment any of the lines below to enable them.
  -- require 'kickstart.plugins.autoformat',
  -- require 'kickstart.plugins.debug',

  -- NOTE: The import below automatically adds your own plugins, configuration, etc from `lua/custom/plugins/*.lua`
  --    You can use this folder to prevent any conflicts with this init.lua if you're interested in keeping
  --    up-to-date with whatever is in the kickstart repo.
  --
  --    For additional information see: https://github.com/folke/lazy.nvim#-structuring-your-plugins
  --
  --    An additional note is that if you only copied in the `init.lua`, you can just comment this line
  --    to get rid of the warning telling you that there are not plugins in `lua/custom/plugins/`.
  -- { import = 'custom.plugins' },
}, {})

-- [[ Setting options ]]
-- See `:help vim.o`

-- Show column at 80 chars
vim.opt.colorcolumn = "80"

vim.o.cursorline = true

-- Statusline only on more thatn 1 window
vim.o.laststatus = 2

-- Right vertical split
vim.o.splitright = true

-- Bellow horizontal split
vim.o.splitbelow = true

-- Set highlight on search
vim.o.hlsearch = false

-- Relative line number
vim.wo.relativenumber = true

-- Show current line number
vim.wo.number = true

-- Disable swap
vim.o.swapfile = false

-- Starts scrolling before reaching the end of the viewport height
vim.o.scrolloff = 10

-- Starts scrolling before reaching the end of the viewport width
vim.o.sidescrolloff = 20

-- Enable mouse mode
vim.o.mouse = 'a'

-- Use spaces
vim.o.expandtab = true

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.o.clipboard = 'unnamedplus'

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.wo.signcolumn = 'yes'

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeout = true
vim.o.timeoutlen = 300

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- NOTE: You should make sure your terminal supports this
vim.o.termguicolors = true
-- vim.o.t_Co = 256

-- Disable word wrap
vim.o.wrap = false

vim.o.tabstop = 2
vim.o.shiftwidth = 2

-- vim.o.shellcmdflag = "-ic"


-- [[ Basic Keymaps ]]

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- See `:help telescope.builtin`
vim.keymap.set('n', '<leader>?', function()
  require('telescope.builtin').oldfiles({
    previewer = false
  })
end, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader><space>', function()
  require('telescope.builtin').buffers({
    previewer = false
  })
end, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer' })

vim.keymap.set('n', '<leader>sf', function()
  require('telescope.builtin').find_files({
    previewer = false
  })
end, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })

-- Harpoon
vim.keymap.set('n', '<leader>ha', require('harpoon.mark').add_file, { desc = '[H]arpoon [A]dd file' })
vim.keymap.set('n', '<leader>hs', require('harpoon.ui').toggle_quick_menu, { desc = '[H]arpoon [S]how files file' })
vim.keymap.set('n', '<leader>1', function() require('harpoon.ui').nav_file(1) end,
  { desc = '[H]arpoon [S]how files file' })
vim.keymap.set('n', '<leader>2', function() require('harpoon.ui').nav_file(2) end,
  { desc = '[H]arpoon [S]how files file' })
vim.keymap.set('n', '<leader>3', function() require('harpoon.ui').nav_file(3) end,
  { desc = '[H]arpoon [S]how files file' })
vim.keymap.set('n', '<leader>4', function() require('harpoon.ui').nav_file(4) end,
  { desc = '[H]arpoon [S]how files file' })
vim.keymap.set('n', '<leader>5', function() require('harpoon.ui').nav_file(5) end,
  { desc = '[H]arpoon [S]how files file' })
vim.keymap.set('n', '<leader>6', function() require('harpoon.ui').nav_file(6) end,
  { desc = '[H]arpoon [S]how files file' })
vim.keymap.set('n', '<leader>7', function() require('harpoon.ui').nav_file(7) end,
  { desc = '[H]arpoon [S]how files file' })
vim.keymap.set('n', '<leader>8', function() require('harpoon.ui').nav_file(8) end,
  { desc = '[H]arpoon [S]how files file' })
vim.keymap.set('n', '<leader>9', function() require('harpoon.ui').nav_file(9) end,
  { desc = '[H]arpoon [S]how files file' })

-- Typescript
vim.keymap.set('n', '<leader>tru', ":TSToolsRemoveUnusedImports<CR>",
  { desc = '[T]ypescript [R]emove [U]nused' })
vim.keymap.set('n', '<leader>tai', ":TSToolsAddMissingImports<CR>",
  { desc = 'TS [A]dd Missing [I]mports' })
-- vim.keymap.set('n', '<leader>tfi', function()
--     pcall(require('typescript').actions.addMissingImports)
--     pcall(require('typescript').actions.removeUnused)
--   end,
--   { desc = 'TS [F]ix [I]mports' })

-- Netrw (folder navigation)
vim.keymap.set('n', '<leader>od', ":Telescope file_browser path=%:p:h select_buffer=true<CR>",
  { desc = '[O]pen [D]irectory' })

vim.cmd('cabbrev term 20sp term://bash')
vim.cmd('cabbrev showcolors so $VIMRUNTIME/syntax/hitest.vim')

-- Quickfix Navigation

-- [[ Configure Treesitter ]]
-- See `:help nvim-treesitter`
require('nvim-treesitter.configs').setup {
  -- Add languages to be installed here that you want installed for treesitter
  ensure_installed = {
    'go',
    'lua',
    'python',
    'rust',
    'tsx',
    'typescript',
    'javascript',
    'json',
    'css',
    'scss',
    'html',
    'help',
    'vim',
    'graphql',
    'gitcommit',
    'git_config',
    'dot',
    'bash',
    'yaml',
    'toml',
    'sql',
  },

  -- Autoinstall languages that are not installed. Defaults to false (but you can change for yourself!)
  auto_install = false,
  highlight = {
    enable = true,
    disable = function(_, bufnr)
      return vim.api.nvim_buf_line_count(bufnr) > 2000
    end,
  },
  indent = {
    enable = true,
    disable = function(lang, bufnr)
      return lang == 'python' or vim.api.nvim_buf_line_count(bufnr) > 2000
    end
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = '<c-space>',
      node_incremental = '<c-space>',
      scope_incremental = '<c-s>',
      node_decremental = '<c-d>',
    },
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ['aa'] = '@parameter.outer',
        ['ia'] = '@parameter.inner',
        ['af'] = '@function.outer',
        ['if'] = '@function.inner',
        ['ac'] = '@class.outer',
        ['ic'] = '@class.inner',
      },
    },
    swap = {
      enable = true,
      swap_next = {
        ['<leader>a'] = '@parameter.inner',
      },
      swap_previous = {
        ['<leader>A'] = '@parameter.inner',
      },
    },
  },
}

-- Diagnostic keymaps
vim.keymap.set('n', '[d', function() vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.ERROR }) end,
  { desc = "Go to previous diagnostic message" })
vim.keymap.set('n', ']d', function() vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.ERROR }) end,
  { desc = "Go to next diagnostic message" })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = "Open diagnostics list" })

-- vim.cmd [[
--   let $BASH_ENV = "~/.bashrc"
-- ]]

-- Terminal keymaps
local exec_terminal = function()
  local cmd = vim.fn.input("$ ")

  if cmd == '' then
    return
  end

  vim.cmd('10sp |:terminal ' .. cmd)
end

vim.keymap.set('n', '<leader>et', exec_terminal, { desc = "[E]xec [T]erminal" })

-- LSP settings.
--  This function gets run when an LSP connects to a particular buffer.
local on_attach = function(_, bufnr)
  -- NOTE: Remember that lua is a real programming language, and as such it is possible
  -- to define small helper and utility functions so you don't have to repeat yourself
  -- many times.
  --
  -- In this case, we create a function that lets us more easily define mappings specific
  -- for LSP related items. It sets the mode, buffer and description for us each time.
  local nmap = function(keys, func, desc)
    if desc then
      desc = 'LSP: ' .. desc
    end

    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
  end

  nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
  nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

  nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
  nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
  nmap('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
  nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
  nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
  nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

  -- See `:help K` for why this keymap
  nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
  nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

  -- Lesser used LSP functionality
  nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
  nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
  nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
  nmap('<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, '[W]orkspace [L]ist Folders')

  vim.api.nvim_create_autocmd("CursorHold", {
    buffer = bufnr,
    callback = function()
      for _, winid in pairs(vim.api.nvim_tabpage_list_wins(0)) do
        if vim.api.nvim_win_get_config(winid).zindex then
          return
        end
      end

      local opts = {
        focus = false,
        close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
        source = 'always',
      }
      vim.diagnostic.open_float(opts)
    end
  })
end

-- Enable the following language servers
--  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
--
--  Add any additional override configuration in the following tables. They will be passed to
--  the `settings` field of the server config. You must look up that documentation yourself.
local servers = {
  -- clangd = {},
  -- gopls = {},
  -- pyright = {},
  -- rust_analyzer = {
  --   cmd = {
  --     "rustup", "run", "stable", "rust-analizer",
  --   },
  -- },
  -- tsserver = {},
  tailwindcss = {},
  lua_ls = {
    Lua = {
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
    },
  },
}

-- Setup neovim lua configuration
require('neodev').setup()

-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- Setup mason so it can manage external tooling
require('mason').setup()

-- Ensure the servers above are installed
local mason_lspconfig = require 'mason-lspconfig'

mason_lspconfig.setup {
  ensure_installed = vim.tbl_keys(servers),
}

vim.diagnostic.config({
  underline = false,
  virtual_text = false,
  virtual_lines = {
    only_current_line = true
  },
  severity_sort = true,
})

local signs = { Error = "E", Warn = "W", Hint = "H", Info = "I" }

for type, _ in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { texthl = hl, numhl = hl })
end

-- Change theme colors
-- vim.cmd [[
--   hi ErrorMsg guifg=#ba5e61 guibg=None
--   hi DiffAdd guibg=None guifg=#87ffaf
--   hi DiffChange guibg=None guifg=#00afdf
--   " hi DiffDelete None
--   " hi link DiffDelete ErrorMsg
--   hi DiagnosticError None
--   hi link DiagnosticError ErrorMsg
--   hi DiagnosticHint guifg=#5fffaf
-- 	hi Comment guifg=#7a7a7a
--   hi ColorColumn guibg=#1c1a17
--   hi CursorLineNr guifg=#d2bfad
--   hi PmenuSel guibg=#8b7449 guifg=#ffffff
-- ]]

mason_lspconfig.setup_handlers {
  function(server_name)
    require('lspconfig')[server_name].setup {
      capabilities = capabilities,
      on_attach = on_attach,
      settings = servers[server_name]
    }
  end,
}

require('lspconfig').tailwindcss.setup {
  init_options = {
    userLanguages = {
      rust = "html"
    },
  },
  settings = {
    tailwindCSS = {
      experimental = {
        classRegex = {
          { "cva\\(([^)]*)\\)", "[\"'`]([^\"'`]*).*?[\"'`]" },
          { "cx\\(([^)]*)\\)",  "(?:'|\"|`)([^']*)(?:'|\"|`)" }
        },
      },
    },
    includeLanguages = {
      rust = "html",
      scss = "css",
    },
  },
  filetypes = {
    "json",
    "rust",
    "html",
    "css",
    "javascript",
    "typescript",
    "typescriptreact",
  }
}

local rust_tools = require("rust-tools")
rust_tools.setup({
  server = {
    capabilities = capabilities,
    on_attach = on_attach,
    settings = {
      cmd = {
        "rustup", "run", "stable", "rust-analizer",
      },
    }
  },
  inlay_hints = {
    auto = true,
  }
})

-- nvim-cmp setup
pcall(function()
  local cmp = require 'cmp'
  local luasnip = require 'luasnip'

  luasnip.config.setup {}

  local t = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
  end

  cmp.setup {
    enable = function()
      return vim.api.nvim_buf_line_count(vim.api.nvim_get_current_buf()) < 1000
    end,
    snippet = {
      expand = function(args)
        luasnip.lsp_expand(args.body)
      end,
    },
    mapping = cmp.mapping.preset.insert {
      ['<C-d>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ["<C-y>"] = cmp.mapping.confirm({ select = true }),
      ["<CR>"] = nil,
      -- ['<CR>'] = cmp.mapping.confirm {
      -- 	behavior = cmp.ConfirmBehavior.Insert,
      -- 	select = false,
      -- },
      ['<C-n>'] = cmp.mapping({
        c = function()
          if cmp.visible() then
            cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
          else
            vim.api.nvim_feedkeys(t('<Down>'), 'n', true)
          end
        end,
        i = function(fallback)
          if cmp.visible() then
            cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
          else
            fallback()
          end
        end
      }),
      ['<C-p>'] = cmp.mapping({
        c = function()
          if cmp.visible() then
            cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
          else
            vim.api.nvim_feedkeys(t('<Up>'), 'n', true)
          end
        end,
        i = function(fallback)
          if cmp.visible() then
            cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
          else
            fallback()
          end
        end
      }),
      ['<C-e>'] = cmp.mapping.abort(),
    },
    sources = {
      { name = 'nvim_lsp' },
      { name = 'luasnip' },
    },
  }
end)

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et

-- Terminal
vim.keymap.set('t', '<ESC>', '<C-\\><C-n>')
local terminal_group = vim.api.nvim_create_augroup('Terminal', { clear = true })
vim.api.nvim_create_autocmd('TermOpen', {
  command = 'startinsert',
  group = terminal_group,
  pattern = '*',
})

local cursorGrp = vim.api.nvim_create_augroup("CursorLine", { clear = true })
vim.api.nvim_create_autocmd(
  { "InsertLeave", "WinEnter" },
  { pattern = "*", command = "set cursorline", group = cursorGrp }
)
vim.api.nvim_create_autocmd(
  { "InsertEnter", "WinLeave" },
  { pattern = "*", command = "set nocursorline", group = cursorGrp }
)

vim.filetype.add({
  pattern = {
    [".env.*"] = "sh",
    ['.*i3config'] = 'i3config',
  },
  filename = {
    [".git/config"] = "gitconfig",
    ["config"] = function(path, bufnr)
      if string.find("[core]", vim.api.nvim_buf_get_lines(bufnr, 0, 1, true)[1]) then
        return "gitconfig"
      end
    end,
  },
})

local prettier_files = {
  "js",
  "ts",
  "jsx",
  "tsx",
  "json",
  "html",
  "json",
  "css",
  "scss",
  "sass",
}

-- Create a command `:Format` local to the LSP buffer
vim.api.nvim_create_user_command('InternalFormat', function(_)
  local file_ext = vim.fn.expand('%:e')

  for _, ext in pairs(prettier_files) do
    if file_ext == ext then
      vim.cmd('silent FormatWrite')
      return
    end
  end

  vim.lsp.buf.format()
end, { desc = 'Format current buffer with LSP' })

local format_group = vim.api.nvim_create_augroup('InternalFormat', { clear = false })
vim.api.nvim_create_autocmd('BufWritePost', {
  callback = function()
    vim.cmd('silent InternalFormat')
  end,
  group = format_group,
  pattern = '*',
})

local ap_filetype = vim.api.nvim_create_augroup('SetApFT', { clear = true })
vim.api.nvim_create_autocmd('BufRead', {
  callback = function()
    vim.cmd('set filetype=ap')
  end,
  group = ap_filetype,
  pattern = '*.ap',
})

vim.api.nvim_create_user_command('DuplicateFile', function(_)
  local current_name = vim.fn.expand('%')
  local new_name = vim.fn.input({
    prompt = "Filename: ",
    default = current_name,
    completion = 'file'
  })

  if new_name == '' then
    return
  end

  local folder = vim.fn.fnamemodify(new_name, ':h')

  vim.fn.system('mkdir -p ' .. folder)
  vim.fn.system('touch ' .. new_name)

  vim.fn.system('cat ' .. current_name .. ' > ' .. new_name)
  vim.fn.execute('e ' .. new_name)
end, {})

vim.api.nvim_create_user_command('TSCheck', function(_)
  -- local defaultCmd = 'npx tsc -p .'
  -- cmd = cmd or defaultCmd

  vim.fn.inputsave()
  local cmd = vim.fn.input({
    prompt = "Command: ",
    default = "npx tsc -p .",
  })
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
end, {})


vim.api.nvim_create_user_command('SvgToJsx', function(_)
  vim.cmd(
    "silent! *s/clip-\\(\\w\\)/clip\\U\\1/g | " ..
    "silent! *s/fill-\\(\\w\\)/fill\\U\\1/g | " ..
    "silent! *s/stroke-\\(\\w\\)/stroke\\U\\1/g"
  )
end, { desc = 'Convert SVG to valid JSX' })
