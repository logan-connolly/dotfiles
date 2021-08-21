Keybind.g({
  -- escape with crtl+c
  { 'i', '<C-c>', '<Esc>', { noremap = true } },
  -- navigate splits
  { 'n', '<C-j>', '<C-w>j', { noremap = true } },
  { 'n', '<C-k>', '<C-w>k', { noremap = true } },
  { 'n', '<C-h>', '<C-w>h', { noremap = true } },
  { 'n', '<C-l>', '<C-w>l', { noremap = true } },
  -- disable Q keymap
  { 'n', 'Q', '<nop>', { noremap = true } },
  -- close buffer
  { 'n', '<Leader>x', '<Esc>:bd<CR>', { noremap = true } },
  -- terminal keymaps
  { 'n', '<Leader>;', '<Cmd>split term://zsh<CR>i', { noremap = true } },
  { 'n', "<Leader>'", '<Cmd>vsplit term://zsh<CR>i', { noremap = true } },
  { 't', '<Esc>', '<C-\\><C-n>', { noremap = true } },
  { 't', '<M-[>', '<Esc>', { noremap = true } },
  { 't', '<C-v><Esc>', '<Esc>', { noremap = true } },
  -- delete without registering word
  { 'v', 'X', '"_d', { noremap = true } },
  -- yank all the content of file to global register
  { 'n', '<Leader>Y', 'gg"+yG', { noremap = true } },
  -- yank to end of line
  { 'n', 'Y', 'y$', { noremap = true } },
  -- undo break points
  { 'i', ',', ',<c-g>u', { noremap = true } },
  { 'i', '.', '.<c-g>u', { noremap = true } },
  { 'i', '!', '!<c-g>u', { noremap = true } },
  { 'i', '?', '?<c-g>u', { noremap = true } },
  -- navigate while staying centered
  { 'n', 'n', 'nzzzv', { noremap = true } },
  { 'n', 'N', 'Nzzzv', { noremap = true } },
  { 'n', 'J', 'mzJ`z', { noremap = true } },
})
