local icons_ok, _ = pcall(require, "icon-picker")
if not icons_ok then
	vim.notify("Unable to load icons config")
	return
end

local opts = { noremap = true, silent = true }

vim.keymap.set("n", "<Leader>fi", function()
	vim.cmd("PickEverything")
end, opts)
