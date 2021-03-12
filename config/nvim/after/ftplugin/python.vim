fun! PythonAuto()
  setlocal expandtab
  setlocal smarttab
  setlocal shiftwidth=4
  setlocal tabstop=4
endfun

augroup format_python
  au!
  autocmd BufWritePost *.py :call PythonAuto()
augroup END
