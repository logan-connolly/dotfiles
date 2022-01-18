local neogit = require('neogit')

neogit.setup {
  disable_commit_confirmation = false,
  integrations = {
    diffview = true
  }
}

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

map('n', '<leader>gm', [[<cmd>lua require'neogit'.open({ "commit" })<cr>]], opts)
map('n', '<leader>gs', [[<cmd>lua require'neogit'.open()<cr>]], opts)
