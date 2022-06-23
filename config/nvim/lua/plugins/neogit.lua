local neogit = require('neogit')

neogit.setup {
  disable_commit_confirmation = true,
  disable_context_highlighting = true,
  integrations = {
    diffview = true
  }
}

-- neogit
vim.keymap.set('n', '<leader>gs', function() neogit.open() end)
vim.keymap.set('n', '<leader>gm', function() neogit.open({ "commit" }) end)

-- diffview
vim.keymap.set('n', '<leader>ghp', function() vim.api.nvim_command("DiffviewFileHistory") end)
vim.keymap.set('n', '<leader>ghb', function() vim.api.nvim_command("DiffviewFileHistory %") end)
vim.keymap.set('n', '<leader>ghd', function() vim.api.nvim_command("DiffviewOpen") end)
