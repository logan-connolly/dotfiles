local packages = {
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
  'nvim-telescope/telescope-file-browser.nvim';
  {'dhruvmanila/telescope-bookmarks.nvim'};
  'tami5/sqlite.lua';
  'nvim-lua/plenary.nvim';

  -- treesitter
  {'nvim-treesitter/nvim-treesitter', run = function() vim.cmd(':TSUpdate') end};
  'nvim-treesitter/nvim-treesitter-refactor';

  -- misc
  'mattn/emmet-vim';
  'famiu/bufdelete.nvim';
  'phaazon/hop.nvim';
  'numToStr/Comment.nvim';
  'norcalli/nvim-colorizer.lua';
  'folke/todo-comments.nvim';
  'folke/zen-mode.nvim';

  -- git
  'lewis6991/gitsigns.nvim';
  'TimUntersberger/neogit';
  'sindrets/diffview.nvim';

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

local function clone_paq()
  local path = vim.fn.stdpath('data') .. '/site/pack/paqs/start/paq-nvim'
  if vim.fn.empty(vim.fn.glob(path)) > 0 then
    vim.fn.system {
      'git',
      'clone',
      '--depth=1',
      'https://github.com/savq/paq-nvim.git',
      path
    }
  end
end

local function bootstrap_paq()
  clone_paq()

  -- Load Paq
  vim.cmd('packadd paq-nvim')
  local paq = require('paq')

  -- Exit nvim after installing plugins
  vim.cmd('autocmd User PaqDoneInstall quit')

  -- Read and install packages
  paq(packages)
  paq.install()
end

return { bootstrap_paq = bootstrap_paq }
