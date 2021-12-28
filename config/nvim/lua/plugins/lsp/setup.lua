local lspconfig = require('lspconfig')
local lspkind = require('lspkind')

-- Adds VSCode like pictograms
lspkind.init {
  with_text = true,
  symbol_map = {
    Text = '',
    Method = 'ƒ',
    Function = 'ﬦ',
    Constructor = '',
    Variable = '',
    Class = '',
    Interface = 'ﰮ',
    Module = '',
    Property = '',
    Unit = '',
    Value = '',
    Enum = '了',
    Keyword = '',
    Snippet = '﬌',
    Color = '',
    File = '',
    Folder = '',
    EnumMember = '',
    Constant = '',
    Struct = '',
  },
}

-- Configure LSP handlers
vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = false,
    underline = false,
  }
)
vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, {border = 'single'})

-- Setup lsp complete with nvim-cmp
local cmp = require'cmp'
cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn['vsnip#anonymous'](args.body)
    end
  },
  mapping = {
    ['<c-Space>'] = cmp.mapping.complete(),
    ['<c-e>'] = cmp.mapping.close(),
    ['<cr>'] = cmp.mapping.confirm({ select = true }),
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'vsnip' },
    { name = 'buffer' },
  },
  formatting = {
    format = function(entry, vim_item)
      vim_item.kind = string.format('%s %s', lspkind.presets.default[vim_item.kind], vim_item.kind)
      vim_item.menu = ({
        nvim_lsp = 'ﲳ',
        nvim_lua = '',
        treesitter = '',
        path = 'ﱮ',
        buffer = '﬘',
        zsh = '',
        vsnip = '',
        spell = '暈',
      })[entry.source.name]
      return vim_item
    end,
  },
})

-- LSP servers to support with optional arguments
local completion = require('plugins.lsp.completion')
local servers = {
  tsserver = {},
  vuels = {},
  pyright = completion.python,
  sumneko_lua = completion.sumneko
}

-- Configure each LSP by attaching completion and status capbilities
for server, config in pairs(servers) do
  config.capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
  lspconfig[server].setup(config)
end
