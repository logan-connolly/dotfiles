local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

map('n', '<leader>ff', [[<cmd>lua require'telescope.builtin'.find_files({ hidden = true })<cr>]], opts)
map('n', '<c-p>', [[<cmd>lua require'telescope.builtin'.git_files({ hidden = true })<cr>]], opts)
map('n', '<leader>fw', [[<cmd>lua require'telescope.builtin'.grep_string({ search = vim.fn.input('🔎 ') })<cr>]], opts)
map('n', '<leader>fb', [[<cmd>lua require'telescope.builtin'.buffers()<cr>]], opts)
map('n', '<leader>fh', [[<cmd>lua require'telescope.builtin'.help_tags()<cr>]], opts)
map('n', '<leader>fp', [[<cmd>lua require'plugins.telescope.setup'.search_plugins()<cr>]], opts)
map('n', '<leader>ft', '<cmd>TodoTelescope<cr>', opts)
map('n', '<leader>fg', [[<cmd>lua require'telescope.builtin'.git_status()<cr>]], opts)
map('n', '<leader>fl', [[<cmd>lua require'telescope.builtin'.git_commits()<cr>]], opts)
map('n', '<leader>fB', [[<cmd>lua require'telescope.builtin'.git_branches()<cr>]], opts)
map('n', '<leader>fk', [[<cmd>lua require'telescope.builtin'.keymaps()<cr>]], opts)
map('n', '<leader>fn', [[<cmd>lua require'telescope.builtin'.treesitter()<cr>]], opts)
map('n', '<leader>fs', [[<cmd>lua require('telescope').extensions.bookmarks.bookmarks()<cr>]], opts)
map('n', '-', "<cmd>lua require 'telescope'.extensions.file_browser.file_browser({cwd = require'telescope.utils'.buffer_dir()})<cr>", opts)
