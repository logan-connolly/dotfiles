local mason_ok, mason = pcall(require, "mason")
local mason_lsp_ok, mason_lsp = pcall(require, "mason-lspconfig")

if not mason_ok or not mason_lsp_ok then
	vim.notify("Unable to load mason config")
	return
end

local lsp_servers = {
	"gopls",
	"pyright",
	"sumneko_lua",
	"tailwindcss",
	"tsserver",
}

local dap_servers = {
	"debugpy",
	"delve",
}

local formatters = {
	"black",
	"isort",
	"gofumpt",
	"goimports",
	"prettier",
	"stylua",
}

mason.setup()
mason_lsp.setup({
	ensure_installed = lsp_servers,
})

local M = {}

function M.bootstrap()
	local lsp = " " .. table.concat(lsp_servers, " ")
	local dap = " " .. table.concat(dap_servers, " ")
	local fmt = " " .. table.concat(formatters, " ")
	vim.cmd("MasonInstall" .. lsp .. dap .. fmt)
end

return M
