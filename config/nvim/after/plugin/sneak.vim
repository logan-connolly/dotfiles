"replace f with sneak
map f <Plug>Sneak_s
map F <Plug>Sneak_S

"minimalist alternative to EasyMotion
let g:sneak#label = 1

" case insensitive sneak
let g:sneak#use_ic_scs = 1

" Change the colors
" highlight Sneak guifg=black guibg=#00C7DF ctermfg=black ctermbg=cyan
" highlight SneakScope guifg=red guibg=yellow ctermfg=red ctermbg=yellow


" Cool prompt
let g:sneak#prompt = 'sneak> '
