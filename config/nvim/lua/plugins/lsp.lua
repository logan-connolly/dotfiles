local on_attach = require'completion'.on_attach
require('lspconfig').tsserver.setup{ on_attach=on_attach }
require('lspconfig').vuels.setup{ on_attach=on_attach }
require('lspconfig').pyls.setup{
  on_attach = on_attach,
  settings = {
    pyls = {
      plugins = {
        pycodestyle = {enabled = false};
        pyflakes = {enabled = false};
      }
    }
  }
}
