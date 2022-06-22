require 'todo-comments'.setup {}

-- Search todos in file buffer
vim.keymap.set('n', '<leader>tdb', function()
  vim.api.nvim_command("TodoTrouble cwd=" .. vim.fn.expand("%"))
end)

-- Search todos in the buffer's parent directory
vim.keymap.set('n', '<leader>tdd', function()
  vim.api.nvim_command("TodoTrouble cwd=" .. vim.fn.expand "%:p:h")
end)

-- Search todos in the entire project
vim.keymap.set('n', '<leader>tdp', function()
  vim.api.nvim_command("TodoTrouble")
end)
