local treesitter_ok, treesitter = pcall(require, "nvim-treesitter.configs")
local treesitter_ctx_ok, treesitter_ctx = pcall(require, "treesitter-context")
if not treesitter_ok or not treesitter_ctx_ok then
	vim.notify("Unable to load treesitter config")
	return
end

treesitter.setup({
	ensure_installed = {
		"bash",
		"css",
		"go",
		"graphql",
		"html",
		"javascript",
		"json",
		"lua",
		"nix",
		"python",
		"toml",
		"typescript",
		"vue",
		"yaml",
	},
	highlight = {
		enable = true,
	},
	indent = {
		enable = false,
	},
	autotag = {
		enable = true,
	},
})
treesitter_ctx.setup({})
