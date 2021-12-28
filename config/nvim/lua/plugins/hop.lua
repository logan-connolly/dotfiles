require 'paq' {
  'phaazon/hop.nvim';
  'rktjmp/lush.nvim';
}

require 'hop'.setup{}

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

map('n', 'f', [[<cmd>lua require'hop'.hint_char1()<cr>]], opts)
map('n', 'F', [[<cmd>lua require'hop'.hint_char2()<cr>]], opts)
