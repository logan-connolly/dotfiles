let g:vimspector_bottombar_height=10
let g:vimspector_sidebar_width = 30

nnoremap <leader>m :MaximizerToggle!<CR>
nnoremap <leader>dd :call vimspector#Launch()<CR>
nnoremap <leader>dx :call vimspector#Reset()<CR>
nnoremap <leader>dc :call vimspector#Continue()<CR>
nnoremap <leader>da :call vimspector#ClearBreakpoints()<CR>

nmap <leader>dl <Plug>VimspectorStepInto
nmap <leader>dj <Plug>VimspectorStepOver
nmap <leader>dk <Plug>VimspectorStepOut
nmap <leader>dr <Plug>VimspectorRestart
nmap <leader>db <Plug>VimspectorToggleBreakpoint
nmap <leader>dp <Plug>VimspectorToggleConditionalBreakpoint
