-- paq.nvim automatic install
local install_path = vim.fn.stdpath('data') .. '/site/pack/paqs/start/paq-nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.cmd('!git clone https://github.com/savq/paq-nvim ' .. install_path)
end

-- hooks
local submodule = 'git submodule update --init --recursive'
local update_treesitter = function() vim.cmd(':TSUpdate') end

require 'paq' {
  'savq/paq-nvim';

  -- language support
  {'nvim-treesitter/nvim-treesitter', run = update_treesitter};
  'nvim-treesitter/nvim-treesitter-refactor';
  'neovim/nvim-lspconfig';
  'nvim-lua/lsp-status.nvim';
  'onsails/lspkind-nvim';
  'dense-analysis/ale';

  -- completion
  'hrsh7th/cmp-nvim-lsp';
  'hrsh7th/cmp-buffer';
  'hrsh7th/nvim-cmp';
  'hrsh7th/cmp-vsnip';
  'hrsh7th/vim-vsnip';

  -- general plugins
  'mattn/emmet-vim';
  'rbgrouleff/bclose.vim';
  'phaazon/hop.nvim';
  'tpope/vim-commentary';
  'norcalli/nvim-colorizer.lua';
  'folke/todo-comments.nvim';

  -- git
  'tpope/vim-fugitive';
  'lewis6991/gitsigns.nvim';

  -- fuzzy finders
  'nvim-lua/popup.nvim';
  'nvim-lua/plenary.nvim';
  {'nvim-telescope/telescope-fzy-native.nvim', run = submodule};
  'nvim-telescope/telescope.nvim';

  -- debugger plugins
  'vim-test/vim-test';
  'mfussenegger/nvim-dap';
  'mfussenegger/nvim-dap-python';
  'dstein64/vim-startuptime';

  -- theme plugins
  'kyazdani42/nvim-web-devicons';
  'rktjmp/lush.nvim';
  'hoob3rt/lualine.nvim';
  'tiagovla/tokyodark.nvim';
}
