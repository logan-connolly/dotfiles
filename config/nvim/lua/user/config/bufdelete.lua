local bufdelete_ok, bufdelete = pcall(require, 'bufdelete')
if not bufdelete_ok then
  vim.notify("Unable to load bufdelete config")
  return
end

-- delete current buffer
vim.keymap.set('n', '<leader>x', function() bufdelete.bufdelete(0, true) end)

