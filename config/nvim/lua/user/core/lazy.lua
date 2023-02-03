require("lazy").setup({
	spec = {
		{ import = "user.plugins" },
	},
	defaults = {
		lazy = true,
	},
	install = { colorscheme = { "gruvbox-material", "habamax" } },
	checker = { enabled = false },
	diff = {
		cmd = "terminal_git",
	},
	performance = {
		cache = {
			enabled = true,
			-- disable_events = {},
		},
		rtp = {
			disabled_plugins = {
				"getscript",
				"getscriptPlugin",
				"gzip",
				"logipat",
				"matchit",
				"matchparen",
				"netrwPlugin",
				"rrhelper",
				"spellfile_plugin",
				"tar",
				"tarPlugin",
				"tohtml",
				"tutor",
				"zip",
				"zipPlugin",
				"vimball",
				"vimballPlugin",
				"2html_plugin",
			},
		},
	},
})
