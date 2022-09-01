local todo_ok, todo = pcall(require, "todo-comments")
if not todo_ok then
	vim.notify("Unable to load todo-comments config")
	return
end

todo.setup({})

-- Search todos in file buffer
vim.keymap.set("n", "<leader>ft", function()
	vim.api.nvim_command("TodoTrouble cwd=" .. vim.fn.expand("%"))
end)

-- Search todos in the entire project
vim.keymap.set("n", "<leader>fT", function()
	vim.api.nvim_command("TodoTrouble")
end)
