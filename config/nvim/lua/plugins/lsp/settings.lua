local lspconfig = require('lspconfig')
local lsp_status = require('lsp-status')
local lspkind = require('lspkind')
local saga = require('lspsaga')
local on_attach = require'completion'.on_attach

-- Adds VSCode like pictograms
lspkind.init()

-- setup saga which improves LSP hover window
saga.init_lsp_saga {
	use_saga_diagnostic_sign = false,
	finder_action_keys = {
		vsplit = "v",
		split = "s",
		quit = { "q", "ESC" },
	}
}

-- Configure linting diagnostics
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
	vim.lsp.diagnostic.on_publish_diagnostics, {
		virtual_text = false,
		underline = false,
	}
)

-- LSP servers to support with optional arguments
local servers = {
  pyright = {},
  tsserver = {},
  vuels = {},
}

-- Configure each LSP by attaching completion and status capbilities
for server, config in pairs(servers) do
  config.on_attach = on_attach
  config.capabilities = vim.tbl_deep_extend(
	  'keep', config.capabilities or {}, lsp_status.capabilities
	)
  lspconfig[server].setup(config)
end
