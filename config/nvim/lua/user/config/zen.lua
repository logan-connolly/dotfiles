local zen_ok, zen = pcall(require, "zen-mode")
if not zen_ok then
	vim.notify("Unable to load neorg config")
	return
end

zen.setup({
	window = {
		backdrop = 1, -- shade the backdrop of the Zen window. Set to 1 to keep the same as Normal
		width = 120, -- width of the Zen window
		height = 1, -- height of the Zen window
		options = {
			-- signcolumn = "no", -- disable signcolumn
			-- cursorline = true, -- disable cursorline
			number = false, -- disable number column
			relativenumber = false, -- disable relative numbers
			cursorcolumn = false, -- disable cursor column
			foldcolumn = "0", -- disable fold column
			list = false, -- disable whitespace characters
		},
	},
	plugins = {
		options = {
			enabled = true,
			ruler = false, -- disables the ruler text in the cmd line area
			showcmd = false, -- disables the command in the last line of the screen
		},
		twilight = { enabled = false }, -- enable to start Twilight when zen mode opens
		gitsigns = { enabled = true }, -- disables git signs
		tmux = { enabled = false }, -- disables the tmux statusline
	},
	-- callback where you can add custom code when the Zen window opens
	on_open = function(win)
		vim.cmd([[set colorcolumn=]])
		vim.cmd([[set signcolumn=yes:4]])
	end,
	-- callback where you can add custom code when the Zen window closes
	on_close = function() end,
})

vim.keymap.set("n", "<c-n>", function()
	zen.toggle()
end)
