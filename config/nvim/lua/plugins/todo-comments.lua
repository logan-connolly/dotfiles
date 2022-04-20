require 'todo-comments'.setup {}

-- Search todos in the buffer's parent directory
vim.keymap.set('n', '<leader>ft', function()
  vim.api.nvim_command("TodoTrouble cwd=" .. vim.fn.expand "%:p:h")
end)

-- Search todos in the entire project
vim.keymap.set('n', '<leader>fT', '<cmd>TodoTrouble<cr>')
