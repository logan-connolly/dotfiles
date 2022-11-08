local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	vim.notify("Unable to load packer")
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

local dap_support = { "python", "go" }

packer.startup(function(use)
	-- package manager
	use({
		"wbthomason/packer.nvim",
		config = function()
			vim.keymap.set("n", "<leader>pc", function()
				vim.cmd("PackerCompile profile=true")
				vim.notify("Packer plugins were compiled")
			end)
			vim.keymap.set("n", "<leader>pp", function()
				vim.cmd("PackerProfile")
			end)
		end,
	})

	-- performance
	use("lewis6991/impatient.nvim")
	use("nathom/filetype.nvim")
	use({ "dstein64/vim-startuptime", cmd = "StartupTime" })

	-- treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		requires = {
			{ "nvim-treesitter/nvim-treesitter-context" },
		},
		config = function()
			require("user.config.treesitter")
		end,
		run = ":TSUpdate",
	})

	-- language support
	use({
		"williamboman/mason.nvim",
		requires = {
			{ "williamboman/mason-lspconfig.nvim" },
			{ "neovim/nvim-lspconfig" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "jose-elias-alvarez/null-ls.nvim" },
		},
		config = function()
			require("user.config.mason")
			require("user.config.lsp")
			require("user.config.null-ls")
		end,
	})

	-- completion
	use({
		"hrsh7th/nvim-cmp",
		requires = {
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-path" },
			{ "hrsh7th/cmp-nvim-lua", ft = "lua" },
			{ "L3MON4D3/LuaSnip" },
			{ "onsails/lspkind-nvim" },
		},
		config = function()
			require("user.config.completion")
		end,
	})

	-- telescope
	use({
		"nvim-telescope/telescope.nvim",
		config = function()
			require("user.config.telescope")
		end,
		requires = {
			{ "nvim-lua/plenary.nvim" },
			{ "stevearc/dressing.nvim" },
			{ "nvim-telescope/telescope-fzy-native.nvim" },
			{ "nvim-telescope/telescope-file-browser.nvim" },
			{ "nvim-telescope/telescope-symbols.nvim" },
			{
				"ThePrimeagen/harpoon",
				config = function()
					require("user.config.harpoon")
				end,
			},
		},
	})

	-- debug / test
	use({
		"mfussenegger/nvim-dap",
		requires = {
			{ "rcarriga/nvim-dap-ui" },
			{ "theHamsta/nvim-dap-virtual-text" },
			{ "mfussenegger/nvim-dap-python" },
			{ "leoluz/nvim-dap-go" },
		},
		config = function()
			require("user.config.dap")
		end,
	})
	use({
		"vim-test/vim-test",
		config = function()
			require("user.config.vim-test")
		end,
	})

	-- git
	use({
		"tpope/vim-fugitive",
		config = function()
			require("user.config.fugitive")
		end,
	})
	use({
		"sindrets/diffview.nvim",
		requires = {
			{ "nvim-lua/plenary.nvim" },
		},
		config = function()
			require("user.config.diffview")
		end,
	})
	use({
		"lewis6991/gitsigns.nvim",
		config = function()
			require("user.config.gitsigns")
		end,
	})

	-- neorg
	use({
		"nvim-neorg/neorg",
		ft = "norg",
		run = ":Neorg sync-parsers",
		config = function()
			require("user.config.neorg")
		end,
	})

	-- misc
	use({
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	})
	use({
		"famiu/bufdelete.nvim",
		config = function()
			vim.keymap.set("n", "<leader>x", function()
				require("bufdelete").bufdelete(0, true)
			end)
		end,
	})
	use({
		"folke/trouble.nvim",
		cmd = "Trouble",
		config = function()
			require("user.config.trouble")
		end,
	})
	use({ "norcalli/nvim-colorizer.lua" })
	use({ "kyazdani42/nvim-web-devicons" })
	use({
		"kyazdani42/nvim-tree.lua",
		tag = "nightly",
		config = function()
			require("user.config.nvim-tree")
		end,
	})
	use({
		"folke/zen-mode.nvim",
		config = function()
			require("user.config.zen")
		end,
	})

	-- theme
	use({
		"wittyjudge/gruvbox-material.nvim",
		config = function()
			vim.cmd("colorscheme gruvbox-material")
		end,
	})
	use({
		"feline-nvim/feline.nvim",
		config = function()
			require("user.config.feline")
		end,
	})

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
