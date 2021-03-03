set background=dark
colorscheme gruvbox8
highlight Normal ctermbg=NONE

let g:python_highlight_all=1

lua << EOF
local lualine = require('lualine')
lualine.theme = 'gruvbox'
lualine.extensions = { 'fzf' }
lualine.status()
EOF
