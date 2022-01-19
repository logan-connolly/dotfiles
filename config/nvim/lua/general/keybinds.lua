local map = vim.api.nvim_set_keymap

-- escape with crtl+c
map('i', '<c-c>', '<esc>', { noremap = true })

-- navigate splits
map('n', '<c-j>', '<c-w>j', { noremap = true })
map('n', '<c-k>', '<c-w>k', { noremap = true })
map('n', '<c-h>', '<c-w>h', { noremap = true })
map('n', '<c-l>', '<c-w>l', { noremap = true })

-- disable Q keymap
map('n', 'Q', '<nop>', { noremap = true })

-- close buffer
map('n', '<leader>Q', '<cmd>bufdo bdelete<cr>', { noremap = true })

-- terminal keymaps
map('n', '<leader>;', '<cmd>split term://zsh<cr>i', { noremap = true })
map('n', "<leader>'", '<cmd>vsplit term://zsh<cr>i', { noremap = true })
map('t', '<esc>', '<c-\\><c-n>', { noremap = true })
map('t', '<M-[>', '<esc>', { noremap = true })
map('t', '<c-v><esc>', '<esc>', { noremap = true })

-- delete without registering word
map('v', 'X', '"_d', { noremap = true })

-- close tab
map('n', '<leader>X', '<cmd>tabc<cr>', { noremap = true, silent = true })

-- yank all the content of file to global register
map('n', '<leader>Y', 'gg"+yG', { noremap = true })

-- yank to end of line
map('n', 'Y', 'y$', { noremap = true })

-- undo break points
map('i', ',', ',<c-g>u', { noremap = true })
map('i', '.', '.<c-g>u', { noremap = true })
map('i', '!', '!<c-g>u', { noremap = true })
map('i', '?', '?<c-g>u', { noremap = true })

-- navigate while staying centered
map('n', 'n', 'nzzzv', { noremap = true })
map('n', 'N', 'Nzzzv', { noremap = true })
map('n', 'J', 'mzJ`z', { noremap = true })

-- open quickfixlist
map('n', 'ql', '<cmd>copen<cr>', { noremap = true })
map('n', 'qj', '<cmd>cnext<cr>', { noremap = true })
map('n', 'qk', '<cmd>cprev<cr>', { noremap = true })

-- reselect after indent
map('v', '<', '<gv', { noremap = true })
map('v', '>', '>gv', { noremap = true })

-- open file according to mimetype
map('n', '<leader>o', '<cmd>!xdg-open %<cr><cr>', { noremap = true })
