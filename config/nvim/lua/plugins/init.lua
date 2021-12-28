-- install paq (plugin manager) if does not exist
local install_path = vim.fn.stdpath('data') .. '/site/pack/paqs/start/paq-nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.cmd('!git clone https://github.com/savq/paq-nvim ' .. install_path)
end

require 'paq' {
  'savq/paq-nvim';
}

-- load plugin configurations
require('plugins.ale')
require('plugins.bclose')
require('plugins.colorizer')
require('plugins.nvim-dap')
require('plugins.emmet')
require('plugins.fugitive')
require('plugins.gitsigns')
require('plugins.hop')
require('plugins.lsp')
require('plugins.lualine')
require('plugins.telescope')
require('plugins.treesitter')
require('plugins.todo-comments')
require('plugins.vim-commentary')
require('plugins.vim-startuptime')
require('plugins.vim-test')

-- load theme last
require('plugins.theme')
