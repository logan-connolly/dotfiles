require 'hop'.setup{}

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

map('n', 's', [[<cmd>lua require'hop'.hint_char1()<cr>]], opts)
map('n', 'S', [[<cmd>lua require'hop'.hint_char2()<cr>]], opts)
