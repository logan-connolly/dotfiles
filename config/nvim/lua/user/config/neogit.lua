local neogit_ok, neogit = pcall(require, "neogit")
if not neogit_ok then
	vim.notify("Unable to load neogit config")
	return
end

neogit.setup({
	disable_commit_confirmation = true,
	disable_context_highlighting = true,
	integrations = {
		diffview = true,
	},
})
-- neogit
vim.keymap.set("n", "<leader>gs", function()
	neogit.open({ kind = "split" })
end)
vim.keymap.set("n", "<leader>gc", function()
	neogit.open({ "commit" })
end)
vim.keymap.set("n", "<leader>gp", function()
	neogit.open({ "push" })
end)
vim.keymap.set("n", "<leader>gl", function()
	neogit.open({ "pull" })
end)

-- diffview
vim.keymap.set("n", "<leader>ghp", function()
	vim.api.nvim_command("DiffviewFileHistory")
end)
vim.keymap.set("n", "<leader>ghb", function()
	vim.api.nvim_command("DiffviewFileHistory %")
end)
vim.keymap.set("n", "<leader>ghd", function()
	vim.api.nvim_command("DiffviewOpen")
end)
