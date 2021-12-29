local install_path = vim.fn.stdpath('data') .. '/site/pack/paqs/start/paq-nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.cmd('!git clone https://github.com/savq/paq-nvim ' .. install_path)
end

-- install plugins
require 'paq' {
  'savq/paq-nvim';

  -- language support
  'neovim/nvim-lspconfig';
  'onsails/lspkind-nvim';
  'mhartington/formatter.nvim';

  -- completion
  'hrsh7th/cmp-buffer';
  'hrsh7th/cmp-nvim-lsp';
  'hrsh7th/cmp-vsnip';
  'hrsh7th/nvim-cmp';
  'hrsh7th/vim-vsnip';

  -- telescope
  'nvim-telescope/telescope.nvim';
  {'nvim-telescope/telescope-fzy-native.nvim', run = 'git submodule update --init --recursive'};
  'nvim-lua/plenary.nvim';

  -- treesitter
  {'nvim-treesitter/nvim-treesitter', run = function() vim.cmd(':TSUpdate') end};
  'nvim-treesitter/nvim-treesitter-refactor';

  -- misc
  'mattn/emmet-vim';
  'rbgrouleff/bclose.vim';
  'phaazon/hop.nvim';
  'tpope/vim-commentary';
  'norcalli/nvim-colorizer.lua';
  'folke/todo-comments.nvim';

  -- git
  'tpope/vim-fugitive';
  'lewis6991/gitsigns.nvim';

  -- test/debug
  'vim-test/vim-test';
  'mfussenegger/nvim-dap';
  'mfussenegger/nvim-dap-python';

  -- performance
  'dstein64/vim-startuptime';
  'lewis6991/impatient.nvim';

  -- theme
  'kyazdani42/nvim-web-devicons';
  'hoob3rt/lualine.nvim';
  'folke/tokyonight.nvim';
}
