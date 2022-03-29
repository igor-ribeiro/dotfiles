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
