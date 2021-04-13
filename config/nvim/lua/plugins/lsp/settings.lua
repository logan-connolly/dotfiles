local lspconfig = require('lspconfig')
local lsp_status = require('lsp-status')
local lspkind = require('lspkind')
local saga = require('lspsaga')
local on_attach = require'completion'.on_attach

lspkind.init()
saga.init_lsp_saga {
	use_saga_diagnostic_sign = false,
	finder_action_keys = {
		vsplit = "v",
		split = "s",
		quit = { "q", "ESC" },
	}
}

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
	vim.lsp.diagnostic.on_publish_diagnostics, {
		virtual_text = false,
		underline = false,
	}
)

local servers = {
  cssls = {
    filetypes = { "css", "scss", "less", "sass" },
    root_dir = lspconfig.util.root_pattern("package.json", ".git")
  },
  pyright = {},
  r_language_server = {},
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
