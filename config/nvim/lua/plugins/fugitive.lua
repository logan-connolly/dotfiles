require 'paq' {
  'tpope/vim-fugitive';
}

local map = vim.api.nvim_set_keymap

map('n', '<leader>gs', [[<cmd>G<cr>]], { noremap = false, silent = true })
map('n', '<leader>gm', [[<cmd>G commit<cr>]], { noremap = false, silent = true })
map('n', '<leader>gf', [[<cmd>diffget //2<cr>]], { noremap = false, silent = true })
map('n', '<leader>gj', [[<cmd>diffget //3<cr>]], { noremap = false, silent = true })
map('n', '<leader>g[', [[<cmd>Git fetch --all<cr>]], { noremap = true, silent = true })
map('n', '<leader>g]', [[<cmd>G push<cr>]], { noremap = true, silent = true })
