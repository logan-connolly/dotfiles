local prettier = function()
  return {
    exe = "prettier",
    args = {"--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)), '--single-quote'},
    stdin = true
  }
end

local black = function()
  return {
    exe = "black",
    args = { '-' },
    stdin = true,
  }
end

require('formatter').setup({
  filetype = {
    html = { prettier },
    css = { prettier },
    json = { prettier },
    markdown = { prettier },
    javascript = { prettier },
    typescript = { prettier },
    vue = { prettier },
    yaml = { prettier },
    python = { black }
  }
})

local map = vim.api.nvim_set_keymap

map('n', '<leader>F', [[<cmd>Format<cr>]], { noremap = false, silent = true })
