set background=dark
colorscheme gruvbox8
highlight Normal ctermbg=NONE

lua << EOF
local lualine = require('lualine')
lualine.theme = 'gruvbox'
lualine.extensions = { 'fzf' }
lualine.status()
EOF
