local vim_test_ok, _ = pcall(require, "harpoon")
if not vim_test_ok then
	vim.notify("Unable to load vim-test config")
	return
end

vim.g["test#strategy"] = "harpoon"
vim.g["test#python#pytest#options"] = "-vv"

vim.keymap.set("n", "<leader>tt", function()
	vim.cmd("TestNearest")
end)
vim.keymap.set("n", "<leader>tf", function()
	vim.cmd("TestFile")
end)
vim.keymap.set("n", "<leader>ta", function()
	vim.cmd("TestSuite")
end)
vim.keymap.set("n", "<leader>tl", function()
	vim.cmd("TestLast")
end)
vim.keymap.set("n", "<leader>tv", function()
	vim.cmd("TestVisit")
end)
