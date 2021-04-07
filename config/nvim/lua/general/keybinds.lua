Keybind.g({
  -- escape with crtl+c
  { 'i', '<C-c>', '<Esc>', { noremap = true } },
  -- navigate splits
  { 'n', '<C-j>', '<C-w>j', { noremap = true } },
  { 'n', '<C-k>', '<C-w>k', { noremap = true } },
  { 'n', '<C-h>', '<C-w>h', { noremap = true } },
  { 'n', '<C-l>', '<C-w>l', { noremap = true } },
  -- move selected line to up/down
  { 'v', 'J', "<Cmd>m \'>+1<CR>gv=gv", { noremap = true } },
  { 'v', 'K', "<Cmd>m \'<-2<CR>gv=gv", { noremap = true } },
  -- disable Q keymap
  { 'n', 'Q', '<nop>', { noremap = true } },
  -- close buffer
  { 'n', '<Leader>x', '<Esc>:bd<CR>', { noremap = true } },
  -- terminal
  { 'n', '<Leader>;', '<Cmd>split term://zsh<CR>i', { noremap = true } },
  { 'n', "<Leader>'", '<Cmd>vsplit term://zsh<CR>i', { noremap = true } },
  { 't', '<Esc>', '<C-\\><C-n>', { noremap = true } },
  { 't', '<M-[>', '<Esc>', { noremap = true } },
  { 't', '<C-v><Esc>', '<Esc>', { noremap = true } },
  -- delete without registering word
  { 'v', 'X', '"_d', { noremap = true } },
  -- delete&local-paste without registering
  { 'v', '<Leader>p', '"_dP', { noremap = true } },
  -- yank to global register
  { 'n', '<Leader>y', '"+y', { noremap = true } },
  { 'v', '<Leader>y', '"+y', { noremap = true } },
  -- ????????
  { 'n', '<Leader>d', '"_d', { noremap = true } },
  { 'v', '<Leader>d', '"_d', { noremap = true } },
  -- yank all the content of file to global register
  { 'n', '<Leader>Y', 'gg"+yG', { noremap = true } },
  -- ominfunc completion
  { 'i', '<C-Space>', '<C-x><C-o>', { noremap = true } },
  { 'i', '<C-@>', '<C-Space>', { noremap = true } },
})
