-- global variables
vim.g.mapleader = " "
vim.g.python3_host_prog = "/usr/bin/python"

-- global scope settings
vim.o.syntax = "on"
vim.o.guicursor = ""
vim.o.encoding = "UTF-8"
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
vim.o.background = "dark"
vim.o.mouse = "a"
vim.o.hlsearch = false
vim.o.updatetime = 50
vim.o.shortmess = vim.o.shortmess .. "c"
vim.o.writebackup = false
vim.o.backup = false
vim.o.cmdheight = 1
vim.o.termguicolors = true
vim.o.completeopt = "menuone,noinsert,noselect"
vim.o.hidden = true
vim.o.clipboard = "unnamedplus"
vim.o.ttimeoutlen = 0

-- window scope settings
vim.wo.number = true
vim.wo.relativenumber = true
vim.wo.signcolumn = "yes:2"
vim.wo.scrolloff = 8
vim.wo.sidescrolloff = 8
vim.wo.wrap = false
vim.wo.colorcolumn = "90"

-- buffer scope settings
vim.bo.expandtab = true
vim.bo.smartindent = true
vim.bo.autoindent = true
vim.bo.swapfile = false
