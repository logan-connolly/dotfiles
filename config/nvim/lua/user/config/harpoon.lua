local harpoon_ok, _ = pcall(require, 'harpoon')
if not harpoon_ok then
  vim.notify("Unable to load harpoon config")
  return
end

local mark = require('harpoon.mark')
local ui = require('harpoon.ui')

vim.keymap.set('n', '<leader>fa', function() mark.add_file() end)
vim.keymap.set('n', '<leader>fm', function() ui.toggle_quick_menu() end)
vim.keymap.set('n', '<leader>fN', function() ui.nav_next() end)
vim.keymap.set('n', '<leader>fP', function() ui.nav_prev() end)
vim.keymap.set('n', '<leader>1', function() ui.nav_file(1) end)
vim.keymap.set('n', '<leader>2', function() ui.nav_file(2) end)
vim.keymap.set('n', '<leader>3', function() ui.nav_file(3) end)
vim.keymap.set('n', '<leader>4', function() ui.nav_file(4) end)
vim.keymap.set('n', '<leader>5', function() ui.nav_file(5) end)
vim.keymap.set('n', '<leader>6', function() ui.nav_file(6) end)
vim.keymap.set('n', '<leader>7', function() ui.nav_file(7) end)
vim.keymap.set('n', '<leader>8', function() ui.nav_file(8) end)
