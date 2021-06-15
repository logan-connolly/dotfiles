require('nvim-treesitter.configs').setup{
  ensure_installed = "maintained",
  highlight = {
    enable = true,
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "fv",
      node_incremental = "fj",
      node_decremental = "fh",
      scope_incremental = "fu",
    },
  },
  indent = {
    enable = false,
  },
  autotag = {
    enable = true,
  },
	refactor = {
		smart_rename = {
			enable = true,
			keymaps = {
				smart_rename = "rb"
			},
		},
	},
}
