require('nvim-treesitter.configs').setup{
  ensure_installed = "maintained",
  highlight = {
    enable = true,
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "fj",
      node_incremental = "fl",
      node_decremental = "fh",
      scope_incremental = "fk",
    },
  },
  indent = {
    enable = true,
  },
  autotag = {
    enable = true,
  },
}
