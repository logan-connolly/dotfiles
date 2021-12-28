require 'paq' {
  'vim-test/vim-test';
}

local map = vim.api.nvim_set_keymap

map('n', '<leader>t', '<cmd>TestNearest<cr>', {})
map('n', '<leader>T', '<cmd>TestFile<cr>', {})
map('n', '<leader>a', '<cmd>TestSuite<cr>', {})
map('n', '<leader>l', '<cmd>TestLast<cr>', {})
map('n', '<leader>v', '<cmd>TestVisit<cr>', {})
