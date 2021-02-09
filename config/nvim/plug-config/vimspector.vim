fun! GotoWindow(id)
    call win_gotoid(a:id)
    MaximizerToggle
endfun

nnoremap <leader>m :MaximizerToggle!<CR>
nnoremap <leader>dd :call vimspector#Launch()<CR>
nnoremap <leader>dx :call vimspector#Reset()<CR>
nnoremap <leader>dc :call vimspector#Continue()<CR>
nnoremap <leader>da :call vimspector#ClearBreakpoints()<CR>
nnoremap <leader>de :call GotoWindow(g:vimspector_session_windows.variables)<CR>
nnoremap <leader>di :call GotoWindow(g:vimspector_session_windows.editor)<CR>

nmap <leader>dl <Plug>VimspectorStepInto
nmap <leader>dj <Plug>VimspectorStepOver
nmap <leader>dk <Plug>VimspectorStepOut
nmap <leader>d_ <Plug>VimspectorRestart
nmap <leader>db <Plug>VimspectorToggleBreakpoint
nmap <leader>dp <Plug>VimspectorToggleConditionalBreakpoint

let g:vimspector_bottombar_height=10
let g:vimspector_sidebar_width = 30
