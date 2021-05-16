-- highlight yanked text
vim.cmd 'au TextYankPost * lua vim.highlight.on_yank {on_visual = false}'

--- transparent background
vim.cmd 'au ColorScheme * hi Normal ctermbg=none guibg=none'
