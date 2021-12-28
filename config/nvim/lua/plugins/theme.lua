require 'paq' {
  'kyazdani42/nvim-web-devicons';
  'tiagovla/tokyodark.nvim';
}

vim.g.tokyodark_transparent_background = true
vim.g.tokyodark_enable_italic_comment = true
vim.g.tokyodark_enable_italic = true
vim.g.tokyodark_color_gamma = '1.5'
vim.cmd('colorscheme tokyodark')
