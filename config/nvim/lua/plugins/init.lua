-- improve plugin loadtime performance
require('impatient')

-- load plugin configurations
require('plugins.bufdelete')
require('plugins.comment')
require('plugins.colorizer')
require('plugins.nvim-dap')
require('plugins.emmet')
require('plugins.formatter')
require('plugins.gitsigns')
require('plugins.hop')
require('plugins.lsp')
require('plugins.lualine')
require('plugins.neogit')
require('plugins.telescope')
require('plugins.treesitter')
require('plugins.trouble')
require('plugins.todo-comments')
require('plugins.vim-test')
require('plugins.zen-mode')

-- load theme last
require('plugins.theme')
