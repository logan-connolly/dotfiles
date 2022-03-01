local ls = require('luasnip')

-- Jump forward a node in snippet if possible
vim.keymap.set({ 'i', 's' }, '<c-k>', function()
  if ls.expand_or_jumpable() then
    ls.expand_or_jump()
  end
end, { silent = true })

-- Jump back a node in snippet if possible
vim.keymap.set({ 'i', 's' }, '<c-j>', function()
  if ls.jumpable(-1) then
    ls.jump(-1)
  end
end, { silent = true })

-- List and select options for choice nodes
vim.keymap.set('i', '<c-l>', function()
  if ls.choice_active() then
    ls.change_choice(1)
  end
end)

-- Resource snippets file
vim.keymap.set('n', '<leader>ss', '<cmd>source ~/.config/nvim/lua/plugins/lsp/snippets.lua<cr>')
