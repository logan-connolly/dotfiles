" Trim whitespace upon save
fun! TrimWhitespace()
  let l:save = winsaveview()
  keeppatterns %s/\s\+$//e
  call winrestview(l:save)
endfun
augroup trim_whitespace
  autocmd!
  autocmd BufWritePre * :call TrimWhitespace()
augroup END

" Turn spellcheck on for markdown files
augroup auto_spellcheck
  autocmd!
  autocmd BufNewFile,BufRead *.md setlocal spell
augroup END

" Highlight text when yanked
augroup highlight_yank
  autocmd!
  autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank({timeout = 120})
augroup END

" Language specific
au BufNewFile,BufRead *.py set tabstop=4 softtabstop=4 shiftwidth=4
