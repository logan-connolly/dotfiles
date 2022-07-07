local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth", "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

local impatient_ok, _ = pcall(require, 'impatient')
if not impatient_ok then
  vim.notify('Unable to use impatient to boost performance')
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  }
}

local lsp_support = { 'css', 'html', 'javascript', 'python', 'go', 'typescript', 'vue', 'lua' }
local dap_support = { 'python', 'go' }

packer.startup(function(use)
  -- package manager
  use 'wbthomason/packer.nvim'

  -- performance
  use 'lewis6991/impatient.nvim'
  use 'nathom/filetype.nvim'
  use { 'dstein64/vim-startuptime', cmd = "StartupTime" }

  -- treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    config = function() require('user.config.treesitter') end,
    run = ':TSUpdate',
  }

  -- language support
  use {
    'neovim/nvim-lspconfig',
    requires = { { 'hrsh7th/cmp-nvim-lsp', ft = lsp_support } },
    ft = lsp_support,
    config = function() require('user.config.lsp') end
  }

  -- completion
  use {
    'hrsh7th/nvim-cmp',
    requires = {
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'hrsh7th/cmp-nvim-lua', ft = "lua" },
      { 'L3MON4D3/LuaSnip' },
      { 'onsails/lspkind-nvim' },
    },
    config = function() require('user.config.completion') end
  }

  -- telescope
  use {
   'nvim-telescope/telescope.nvim',
   config = function() require('user.config.telescope') end,
   requires = {
     { 'nvim-lua/plenary.nvim' },
     { 'nvim-telescope/telescope-fzy-native.nvim' },
     { 'nvim-telescope/telescope-file-browser.nvim' },
     { 'ThePrimeagen/harpoon', config = function() require('user.config.harpoon') end},
    },
  }

  -- debugging
  use {
    'mfussenegger/nvim-dap',
    requires = {
      { 'rcarriga/nvim-dap-ui', ft = dap_support, config = function() require('dapui').setup() end },
      { 'theHamsta/nvim-dap-virtual-text', ft = dap_support, config = function() require('nvim-dap-virtual-text').setup() end },
      { 'mfussenegger/nvim-dap-python', ft = "python" },
      { 'leoluz/nvim-dap-go', ft = "go" },
    },
    ft = dap_support,
    config = function() require('user.config.dap') end,
  }

  -- neogit
  use {
    'TimUntersberger/neogit',
    requires = {
      { 'nvim-lua/plenary.nvim' },
      { 'sindrets/diffview.nvim' },
    },
    config = function() require('user.config.neogit') end
  }

  -- markdown
  use {
    'iamcco/markdown-preview.nvim',
    ft = 'markdown',
    run = 'cd app && yarn install',
    config = function() require('user.config.markdown') end
  }

  -- misc
  use { 'norcalli/nvim-colorizer.lua', ft = { "css", "javascript", "html" } }
  use { 'numToStr/Comment.nvim', config = function() require('Comment').setup() end }
  use { 'famiu/bufdelete.nvim', config = function() require('user.config.bufdelete') end }
  use { 'folke/trouble.nvim', cmd = "Trouble", config = function() require('user.config.trouble') end}
  use { 'folke/todo-comments.nvim', config = function() require('user.config.todo-comments') end}
  use { 'lewis6991/gitsigns.nvim', config = function() require("user.config.gitsigns") end }
  use { 'vim-test/vim-test', config = function() require('user.config.vim-test') end }
  use { 'jose-elias-alvarez/null-ls.nvim', config = function() require('user.config.null-ls') end}

  -- theme
  use 'kyazdani42/nvim-web-devicons'
  use { 'wittyjudge/gruvbox-material.nvim', config = function() vim.cmd('colorscheme gruvbox-material') end }
  use { 'hoob3rt/lualine.nvim', config = function() require('user.config.lualine') end }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end

end)

-- keymaps for compiling and profiling plugins
vim.keymap.set('n', '<leader>pc', function()
  vim.cmd('PackerCompile profile=true')
  vim.notify('Packer plugins were compiled')
end)
vim.keymap.set('n', '<leader>pp', function() vim.cmd('PackerProfile') end)
