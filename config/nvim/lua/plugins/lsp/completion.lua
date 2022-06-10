local lspkind = require('lspkind')
local cmp = require('cmp')

cmp.setup({
  mapping = {
    ['<c-n>'] = cmp.mapping.select_next_item(),
    ['<c-p>'] = cmp.mapping.select_prev_item(),
    ['<c-Space>'] = cmp.mapping.complete(),
    ['<c-e>'] = cmp.mapping.close(),
    ['<cr>'] = cmp.mapping.confirm({ select = true }),
  },
  sources = {
    { name = 'nvim_lua' },
    { name = 'nvim_lsp' },
    { name = 'path' },
    { name = 'buffer', keyword_length = 5},
  },
  formatting = {
    format = function(entry, vim_item)
      vim_item.kind = string.format('%s %s', lspkind.presets.default[vim_item.kind], vim_item.kind)
      vim_item.menu = ({
        nvim_lsp = 'ﲳ',
        nvim_lua = '',
        treesitter = '',
        path = 'ﱮ',
        buffer = '﬘',
      })[entry.source.name]
      return vim_item
    end,
  },
})
