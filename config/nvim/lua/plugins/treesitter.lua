local update_treesitter = function() vim.cmd(':TSUpdate') end

require 'paq' {
  {'nvim-treesitter/nvim-treesitter', run = update_treesitter};
  'nvim-treesitter/nvim-treesitter-refactor';
}

require('nvim-treesitter.configs').setup{
  ensure_installed = 'maintained',
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
