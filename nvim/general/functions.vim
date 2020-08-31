au BufNewFile,BufRead *.py set tabstop=4 softtabstop=4 shiftwidth=4 textwidth=88
au BufNewFile,BufRead *.js,*.css,*.html set tabstop=2 softtabstop=2 shiftwidth=2

" Turn spellcheck on for markdown files
augroup auto_spellcheck
  autocmd BufNewFile,BufRead *.md setlocal spell
augroup END
