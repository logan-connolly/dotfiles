-- Globals
Option.g({
	-- general
	syntax = "on",
	encoding = "UTF-8",
	exrc = true,
	number = true,
	incsearch = true,
	showmode = false,
	compatible = false,
	errorbells = false,
	tabstop = 2,
	softtabstop = 2,
	shiftwidth = 2,
	splitright = true,
	splitbelow = true,
	-- editor
	background = 'dark',
	mouse = 'a',
	hlsearch = false,
	updatetime = 50,
	shortmess = vim.o.shortmess .. 'c',
	writebackup = false,
	backup = false,
	cmdheight = 1,
	termguicolors = true,
	-- editing
	completeopt = 'menuone,noinsert,noselect',
	hidden = true,
	smartcase = true,
	-- clipboard= vim.o.unamedplus .. 'unnamedplus',
	clipboard = 'unnamedplus',
})

-- Window
Option.w({
	number = true,
	relativenumber = true,
	signcolumn = 'yes',
	scrolloff = 8,
	sidescrolloff = 8,
	wrap = false,
	colorcolumn = "90",
})

-- Buffer
Option.b({
	expandtab = true,
	smartindent = true,
	autoindent = true,
	swapfile = false,
})
