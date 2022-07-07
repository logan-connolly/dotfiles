local map = vim.api.nvim_set_keymap

map("n", "<leader>tt", "<cmd>TestNearest<cr>", {})
map("n", "<leader>tf", "<cmd>TestFile<cr>", {})
map("n", "<leader>ta", "<cmd>TestSuite<cr>", {})
map("n", "<leader>tl", "<cmd>TestLast<cr>", {})
map("n", "<leader>tv", "<cmd>TestVisit<cr>", {})
