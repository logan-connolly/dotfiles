require('nvim-treesitter.configs').setup{
  ensure_installed = {
    "bash", "css", "go", "graphql", "html", "javascript", "json", "lua", "nix",
    "python", "toml", "typescript", "vue", "yaml",
  },
  highlight = {
    enable = true,
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = 'fv',
      node_incremental = 'fj',
      node_decremental = 'fh',
      scope_incremental = 'fu',
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
        smart_rename = 'rb'
      },
    },
  },
}
