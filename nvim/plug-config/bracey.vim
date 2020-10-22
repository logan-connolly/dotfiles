map <F7> :Bracey<CR> 

let g:bracey_eval_on_save = 1
let g:bracey_refresh_on_save = 1
autocmd BufWritePost *.js call bracey#reload()
