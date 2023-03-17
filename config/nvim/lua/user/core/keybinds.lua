-- Navigation
vim.keymap.set("n", "<c-j>", "<c-w>j", { remap = false, desc = "Move to split below" })
vim.keymap.set("n", "<c-k>", "<c-w>k", { remap = false, desc = "Move to split above" })
vim.keymap.set("n", "<c-h>", "<c-w>h", { remap = false, desc = "Move to left split" })
vim.keymap.set("n", "<c-l>", "<c-w>l", { remap = false, desc = "Move to right split" })
vim.keymap.set("n", "n", "nzzzv", { remap = false, desc = "Next search result" })
vim.keymap.set("n", "N", "Nzzzv", { remap = false, desc = "Prev search result" })

-- Editing
vim.keymap.set("v", "D", '"_d', { remap = false, desc = "Delete without registering" })
vim.keymap.set("n", "Y", "y$", { remap = false, desc = "Yank to end of line" })
vim.keymap.set("n", "gy", 'gg"+yG', { remap = false, desc = "Yank entire buffer" })
vim.keymap.set("n", "J", "mzJ`z", { remap = false, desc = "Bring up line from below" })
vim.keymap.set("v", "<", "<gv", { remap = false, desc = "Move indentation to left" })
vim.keymap.set("v", ">", ">gv", { remap = false, desc = "Move indentation to right" })
vim.keymap.set("n", "ql", "<cmd>copen<cr>", { remap = false, desc = "Open quickfixlist" })
vim.keymap.set("n", "qj", "<cmd>cnext<cr>", { remap = false, desc = "Next quickfixlist item" })
vim.keymap.set("n", "qk", "<cmd>cprev<cr>", { remap = false, desc = "Prev quickfixlist item" })
vim.keymap.set("i", ",", ",<c-g>u", { remap = false, desc = "Undo break point on ," })
vim.keymap.set("i", ".", ".<c-g>u", { remap = false, desc = "Undo break point on ." })
vim.keymap.set("i", "!", "!<c-g>u", { remap = false, desc = "Undo break point on !" })
vim.keymap.set("i", "?", "?<c-g>u", { remap = false, desc = "Undo break point on ?" })

-- Misc
vim.keymap.set("n", "<s-tab>", "za", { remap = false, silent = true, desc = "Toggle fold" })
vim.keymap.set("i", "<c-c>", "<esc>", { remap = false, desc = "Escape with ctrl-c" })
vim.keymap.set("n", "Q", "<nop>", { remap = false, desc = "Deactivate Q" })
