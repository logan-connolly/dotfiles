require("lazy").setup({
	spec = {
		{ import = "user.plugins" },
	},
	defaults = {
		lazy = true,
	},
	performance = {
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
