-- paq.nvim automatic install
local install_path = vim.fn.stdpath("data") .. "/site/pack/paqs/opt/paq-nvim"
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.cmd("!git clone https://github.com/savq/paq-nvim " .. install_path)
end

-- paq alias
vim.cmd 'packadd paq-nvim'
local paq = require('paq-nvim').paq
paq { 'savq/paq-nvim', opt = true }

-- hooks
local submodule = 'git submodule update --init --recursive'
local update_treesitter = function() vim.cmd(":TSUpdate") end

-- language support
paq { 'nvim-treesitter/nvim-treesitter', run = update_treesitter }
paq { 'nvim-treesitter/nvim-treesitter-refactor' }
paq { 'neovim/nvim-lspconfig' }
paq { 'nvim-lua/lsp-status.nvim' }
paq { 'onsails/lspkind-nvim' }
paq { 'dense-analysis/ale' }

-- completion
paq { 'hrsh7th/cmp-nvim-lsp' }
paq { 'hrsh7th/cmp-buffer' }
paq { 'hrsh7th/nvim-cmp' }

-- snippets
paq { 'hrsh7th/cmp-vsnip' }
paq { 'hrsh7th/vim-vsnip' }

-- general plugins
paq { 'mattn/emmet-vim' }
paq { 'rbgrouleff/bclose.vim' }
paq { 'phaazon/hop.nvim' }
paq { 'preservim/tagbar' }
paq { 'tpope/vim-commentary' }
paq { 'norcalli/nvim-colorizer.lua' }
paq { 'folke/todo-comments.nvim' }

-- git
paq { 'tpope/vim-fugitive' }
paq { 'lewis6991/gitsigns.nvim' }

-- fuzzy finders
paq { 'nvim-lua/popup.nvim' }
paq { 'nvim-lua/plenary.nvim' }
paq { 'nvim-telescope/telescope-fzy-native.nvim', run = submodule }
paq { 'nvim-telescope/telescope.nvim' }

-- debugger plugins
paq { 'mfussenegger/nvim-dap' }
paq { 'mfussenegger/nvim-dap-python' }

-- theme plugins
paq { 'kyazdani42/nvim-web-devicons' }
paq { 'rktjmp/lush.nvim' }
paq { 'npxbr/gruvbox.nvim' }
paq { 'hoob3rt/lualine.nvim' }
paq { 'tiagovla/tokyodark.nvim' }

-- PaqInstall if do not exist
local plugin_path = vim.fn.stdpath("data") .. "/site/pack/paqs/start"
if vim.fn.empty(vim.fn.glob(plugin_path)) > 0 then
  vim.cmd 'PaqInstall'
end
