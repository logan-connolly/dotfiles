-- highlight yanked text
vim.cmd 'au TextYankPost * lua vim.highlight.on_yank {on_visual = false}'

-- transparent background
vim.cmd 'au ColorScheme * hi Normal ctermbg=none guibg=none'

-- override tpope/fugitive colorscheme
vim.cmd 'au VimEnter * hi diffAdded guifg=#9ece6a'
vim.cmd 'au VimEnter * hi diffRemoved guifg=#f7768e'
