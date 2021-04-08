 -- paq.nvim automatic install
local install_path = vim.fn.stdpath("data") .. "/site/pack/paq/opt/paq-nvim"
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
		vim.cmd("!git clone https://github.com/savq/paq-nvim " .. install_path)
end

-- paq alias
vim.cmd 'packadd paq-nvim'
local paq = require('paq-nvim').paq

-- general plugins
paq { 'savq/paq-nvim', opt = true }
paq { 'nvim-treesitter/nvim-treesitter' }
paq { 'neovim/nvim-lspconfig' }
paq { 'chrisbra/Colorizer' }
paq { 'mattn/emmet-vim' }
paq { 'rbgrouleff/bclose.vim' }
paq { 'phaazon/hop.nvim' }
paq { 'preservim/tagbar' }
paq { 'tpope/vim-commentary' }
paq { 'tpope/vim-fugitive' }
paq { 'tpope/vim-vinegar' }

-- fuzzy finders
paq { 'nvim-lua/popup.nvim' }
paq { 'nvim-lua/plenary.nvim' }
paq { 'nvim-telescope/telescope.nvim' }
paq { 'nvim-telescope/telescope-fzy-native.nvim' }

-- debugger plugins
paq { 'puremourning/vimspector' }
paq { 'szw/vim-maximizer' }

-- language specific
paq { 'neovim/nvim-lspconfig' }
paq { 'nvim-lua/completion-nvim' }
paq { 'sheerun/vim-polyglot' }
paq { 'w0rp/ale' }

-- theme plugins
paq { 'kyazdani42/nvim-web-devicons' }
paq { 'lifepillar/vim-gruvbox8' }
paq { 'hoob3rt/lualine.nvim' }

-- PaqInstall if do not exist
local plugin_path = vim.fn.stdpath("data") .. "/site/pack/paqs"
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
		vim.cmd[[ PaqInstall ]]
end
