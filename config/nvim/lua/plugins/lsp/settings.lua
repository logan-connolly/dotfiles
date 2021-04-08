local lspconfig = require('lspconfig')
local lsp_status = require('lsp-status')
local lspkind = require('lspkind')
local saga = require('lspsaga')
local on_attach = require'completion'.on_attach

saga.init_lsp_saga()
lspkind.init()

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
	vim.lsp.diagnostic.on_publish_diagnostics, {
		virtual_text = false,
		underline = false,
		signs = { severity_limit = "Error" }
	}
)

local servers = {
	cssls = {
    filetypes = { "css", "scss", "less", "sass" },
    root_dir = lspconfig.util.root_pattern("package.json", ".git")
  },
  pyright = {},
  tsserver = {},
  vuels = {},
}

local snippet_capabilities = {
  textDocument = {completion = {completionItem = {snippetSupport = true}}}
}

for server, config in pairs(servers) do
  config.on_attach = on_attach
  config.capabilities = vim.tbl_deep_extend('keep', config.capabilities or {},
                                            lsp_status.capabilities, snippet_capabilities)
  lspconfig[server].setup(config)
end
