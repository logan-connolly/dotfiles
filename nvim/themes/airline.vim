"key mappings
nnoremap <F12> :buffers<CR>:buffer<Space>
map <esc>[1;0D <C-Left>
map <esc>[1;0C <C-Right>
map <C-Right> :bn<CR>
map <C-Left> :bp<CR>
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8

"airline status bar configuration
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#tabline#tabnr_formatter = 'tabnr'
let g:airline#extensions#tabline#buffers_label = 'b'
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tabline#formatter = 'default'
let g:airline#extensions#tabline#buffer_nr_show = 0
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#coc#enabled = 1
let g:airline_theme = 'gruvbox' 
