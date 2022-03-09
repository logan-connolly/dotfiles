local packages = {
  'savq/paq-nvim';

  -- language support
  'neovim/nvim-lspconfig';
  'onsails/lspkind-nvim';
  'mhartington/formatter.nvim';

  -- completion
  'hrsh7th/nvim-cmp';
  'hrsh7th/cmp-buffer';
  'hrsh7th/cmp-nvim-lsp';
  'hrsh7th/cmp-path';
  'hrsh7th/cmp-nvim-lua';

  -- snippets
  'L3MON4D3/LuaSnip';
  'saadparwaiz1/cmp_luasnip';
  'rafamadriz/friendly-snippets';

  -- telescope
  'nvim-lua/plenary.nvim';
  'nvim-telescope/telescope.nvim';
  {'nvim-telescope/telescope-fzy-native.nvim', run = 'git submodule update --init --recursive'};
  'nvim-telescope/telescope-file-browser.nvim';

  -- treesitter
  {'nvim-treesitter/nvim-treesitter', run = function() vim.cmd(':TSUpdate') end};
  'nvim-treesitter/nvim-treesitter-refactor';

  -- misc
  'famiu/bufdelete.nvim';
  'phaazon/hop.nvim';
  'numToStr/Comment.nvim';
  'norcalli/nvim-colorizer.lua';
  'folke/todo-comments.nvim';
  'folke/trouble.nvim';
  'folke/zen-mode.nvim';

  -- git
  'lewis6991/gitsigns.nvim';
  'TimUntersberger/neogit';
  'sindrets/diffview.nvim';

  -- test/debug
  'vim-test/vim-test';
  'mfussenegger/nvim-dap';
  'rcarriga/nvim-dap-ui';
  'mfussenegger/nvim-dap-python';

  -- performance
  'dstein64/vim-startuptime';
  'lewis6991/impatient.nvim';
  'nathom/filetype.nvim';

  -- theme
  'kyazdani42/nvim-web-devicons';
  'hoob3rt/lualine.nvim';
  'rose-pine/neovim';
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

local function clean_paq()
  local paq = require('paq')
  paq.clean()
end

return {
  bootstrap_paq = bootstrap_paq,
  clean_paq = clean_paq,
}
