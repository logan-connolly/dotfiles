require 'paq' {
  'mattn/emmet-vim';
}

vim.cmd 'autocmd FileType html,css,vue,javascript,javascript.jsx EmmetInstall'

vim.g.user_emmet_install_global = 0
vim.g.user_emmet_leader_key = ','
vim.g.user_emmet_settings = {
  javascript = {
    extends = 'jsx'
  }
}
