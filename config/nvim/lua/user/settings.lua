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

-- window scope settings
vim.wo.number = true
vim.wo.relativenumber = true
vim.wo.signcolumn = "yes"
vim.wo.scrolloff = 8
vim.wo.sidescrolloff = 8
vim.wo.wrap = false
vim.wo.colorcolumn = "90"

-- buffer scope settings
vim.bo.expandtab = true
vim.bo.smartindent = true
vim.bo.autoindent = true
vim.bo.swapfile = false

-- netrw settings
vim.g.netrw_banner = 0
vim.g.netrw_keepdir = 0
vim.g.netrw_liststyle = 3
vim.g.netrw_browse_split = 4
vim.g.netrw_winsize = 25
vim.g.netrw_localcopydircmd = "cp -r"

-- disable builtins
local disabled_built_ins = {
	"gzip",
	"zip",
	"zipPlugin",
	"tar",
	"tarPlugin",
	"getscript",
	"getscriptPlugin",
	"vimball",
	"vimballPlugin",
	"2html_plugin",
	"logipat",
	"rrhelper",
	"spellfile_plugin",
	"matchit",
}

for _, plugin in pairs(disabled_built_ins) do
	vim.g["loaded_" .. plugin] = 1
end
