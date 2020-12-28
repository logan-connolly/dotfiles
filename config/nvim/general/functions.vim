au BufNewFile,BufRead *.py set tabstop=4 softtabstop=4 shiftwidth=4
au BufNewFile,BufRead *.js,*.css,*.html set tabstop=2 softtabstop=2 shiftwidth=2

" Turn spellcheck on for markdown files
augroup auto_spellcheck
  autocmd BufNewFile,BufRead *.md setlocal spell
augroup END

augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank({timeout = 120})
augroup END
