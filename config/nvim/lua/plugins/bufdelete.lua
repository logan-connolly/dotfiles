local map = vim.api.nvim_set_keymap

map('n', '<leader>x', [[<cmd>lua require('bufdelete').bufdelete(0, true)<cr>]], { noremap = true, silent = true })
