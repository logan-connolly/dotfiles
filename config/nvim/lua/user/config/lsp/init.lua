local lspconfig_ok, lspconfig = pcall(require, "lspconfig")
local cmp_lsp_ok, cmp_lsp = pcall(require, "cmp_nvim_lsp")
if not lspconfig_ok or not cmp_lsp_ok then
	vim.notify("Unable to load lspconfig config")
	return
end

-- LSP servers with optional settings
local language = require("user.config.lsp.language")
local server_configs = {
	gopls = {},
	pyright = language.python,
	sumneko_lua = language.sumneko,
	tsserver = {},
	tailwindcss = {},
}

-- Configure each LSP by attaching completion and capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.preselectSupport = true
capabilities.textDocument.completion.completionItem.insertReplaceSupport = true
capabilities.textDocument.completion.completionItem.labelDetailsSupport = true
capabilities.textDocument.completion.completionItem.deprecatedSupport = true
capabilities.textDocument.completion.completionItem.commitCharactersSupport = true
capabilities.textDocument.completion.completionItem.tagSupport = { valueSet = { 1 } }
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
	properties = { "documentation", "detail", "additionalTextEdits" },
}
capabilities.textDocument.codeAction = {
	dynamicRegistration = false,
	codeActionLiteralSupport = {
		codeActionKind = {
			valueSet = {
				"",
				"quickfix",
				"refactor",
				"refactor.extract",
				"refactor.inline",
				"refactor.rewrite",
				"source",
				"source.organizeImports",
			},
		},
	},
}
capabilities = cmp_lsp.default_capabilities(capabilities)

for server, config in pairs(server_configs) do
	config.capabilities = capabilities
	lspconfig[server].setup(config)
end

-- Add icons for diagnostics
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

-- Configure LSP handlers
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
	virtual_text = false,
	underline = false,
})
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "single" })

-- Global settings
vim.g.completion_matching_strategy_list = { "exact", "substring", "fuzzy" }

-- Custom keymaps
vim.keymap.set("n", "gd", function()
	vim.lsp.buf.definition()
end)
vim.keymap.set("n", "gr", function()
	vim.lsp.buf.references()
end)
vim.keymap.set("n", "K", function()
	vim.lsp.buf.hover()
end)
vim.keymap.set("i", "<c-k>", function()
	vim.lsp.buf.signature_help()
end)
vim.keymap.set("n", "<leader>rn", function()
	vim.lsp.buf.rename()
end)
vim.keymap.set("n", "<leader>k", function()
	vim.diagnostic.goto_prev()
end)
vim.keymap.set("n", "<leader>j", function()
	vim.diagnostic.goto_next()
end)
vim.keymap.set("n", "<leader>l", function()
	vim.diagnostic.open_float()
end)
vim.keymap.set("n", "<leader>D", function()
	vim.diagnostic.setqflist()
end)
