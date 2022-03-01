local lspconfig = require('lspconfig')

-- LSP servers with optional settings
local server_configs = {
  ansiblels = {},
  cssls = {},
  pyright = require'plugins.lsp.config.python'.settings,
  sumneko_lua = require'plugins.lsp.config.sumneko'.settings,
  tsserver = {},
  tailwindcss = {},
  vuels = {},
}

-- Configure each LSP by attaching completion and capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)
for server, config in pairs(server_configs) do
  config.capabilities = capabilities
  lspconfig[server].setup(config)
end
