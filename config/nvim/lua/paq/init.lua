 -- paq.nvim automatic install
local install_path = vim.fn.stdpath("data") .. "/site/pack/paqs/opt/paq-nvim"
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
		vim.cmd("!git clone https://github.com/savq/paq-nvim " .. install_path)
end

-- paq alias
vim.cmd 'packadd paq-nvim'
local paq = require('paq-nvim').paq
local submodule = 'git submodule update --init --recursive'
local update_treesitter = function() vim.cmd(":TSUpdate") end

-- language support
paq { 'nvim-treesitter/nvim-treesitter', run = update_treesitter}
paq { 'neovim/nvim-lspconfig' }
paq { 'nvim-lua/completion-nvim' }
paq { 'nvim-lua/lsp-status.nvim' } 
paq { 'onsails/lspkind-nvim' }
paq { 'glepnir/lspsaga.nvim' }

-- general plugins
paq { 'mattn/emmet-vim' }
paq { 'rbgrouleff/bclose.vim' }
paq { 'phaazon/hop.nvim' }
paq { 'preservim/tagbar' }
paq { 'tpope/vim-commentary' }
paq { 'tpope/vim-fugitive' }
paq { 'tpope/vim-vinegar' }
paq { 'norcalli/nvim-colorizer.lua' }

-- fuzzy finders
paq { 'nvim-lua/popup.nvim' }
paq { 'nvim-lua/plenary.nvim' }
paq { 'nvim-telescope/telescope.nvim' }
paq { 'nvim-telescope/telescope-fzy-native.nvim', run = submodule }

-- debugger plugins
paq { 'puremourning/vimspector' }
paq { 'szw/vim-maximizer' }

-- theme plugins
paq { 'kyazdani42/nvim-web-devicons' }
paq { 'rktjmp/lush.nvim' }
paq { 'npxbr/gruvbox.nvim' }
paq { 'hoob3rt/lualine.nvim' }

-- PaqInstall if do not exist
local plugin_path = vim.fn.stdpath("data") .. "/site/pack/paqs/start"
if vim.fn.empty(vim.fn.glob(plugin_path)) > 0 then
	vim.cmd 'PaqInstall'
end
