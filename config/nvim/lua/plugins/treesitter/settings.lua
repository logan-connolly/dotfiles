require('nvim-treesitter.configs').setup{
  ensure_installed = "maintained",
  highlight = {
    enable = false,
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "tv",
      node_incremental = "tj",
      node_decremental = "tk",
      scope_incremental = "tu",
    },
  },
  indent = {
    enable = true,
  },
  autotag = {
    enable = true,
  },
}
