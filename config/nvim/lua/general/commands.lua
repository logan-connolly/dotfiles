-- highlight yanked text
vim.cmd 'au TextYankPost * lua vim.highlight.on_yank {on_visual = false}'

-- format on save
vim.cmd 'augroup Format'
vim.cmd 'autocmd!'
vim.cmd 'autocmd BufWritePost * FormatWrite'
vim.cmd 'augroup END'
