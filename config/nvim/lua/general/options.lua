-- general
vim.o.syntax = 'on'
vim.o.encoding = 'UTF-8'
vim.o.exrc = true
vim.o.number = true
vim.o.incsearch = true
vim.o.showmode = false
vim.o.compatible = false
vim.o.errorbells = false
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.splitright = true
vim.o.splitbelow = true

-- editor
vim.o.background = 'dark'
vim.o.mouse = 'a'
vim.o.hlsearch = false
vim.o.updatetime = 50
vim.o.shortmess = vim.o.shortmess .. 'c'
vim.o.writebackup = false
vim.o.backup = false
vim.o.cmdheight = 1
vim.o.termguicolors = true

-- editing
vim.o.completeopt = 'menuone,noinsert,noselect'
vim.o.hidden = true
vim.o.smartcase = true
vim.o.clipboard = 'unnamedplus'

-- window scoped
vim.wo.number = true
vim.wo.relativenumber = true
vim.wo.signcolumn = 'yes'
vim.wo.scrolloff = 8
vim.wo.sidescrolloff = 8
vim.wo.wrap = false
vim.wo.colorcolumn = '90'

-- buffer scoped
vim.bo.expandtab = true
vim.bo.smartindent = true
vim.bo.autoindent = true
vim.bo.swapfile = false
