lua << EOF
local lualine = require('lualine')
lualine.theme = 'gruvbox'
lualine.extensions = { 'fzf' }
lualine.status()
EOF
