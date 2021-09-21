local lspconfig = require('lspconfig')
local lspkind = require('lspkind')

-- Adds VSCode like pictograms
lspkind.init()

-- Configure LSP handlers
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = false,
    underline = false,
  }
)
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {border = "single"})

-- Setup lsp complete with nvim-cmp
local cmp = require'cmp'
require'cmp'.setup({
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end
  },
  mapping = {
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'vsnip' },
    { name = 'buffer' },
  }
})

-- local lsp settings
local python = require('plugins.lsp.settings.python')
local sumneko = require('plugins.lsp.settings.sumneko')

-- LSP servers to support with optional arguments
local servers = {
  tsserver = {},
  vuels = {},
  pyright = python.settings,
  sumneko_lua = sumneko.settings
}

-- Configure each LSP by attaching completion and status capbilities
for server, config in pairs(servers) do
  config.capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
  lspconfig[server].setup(config)
end
