lua require("nvimlua")

nnoremap <C-p> :lua require('telescope.builtin').git_files({ hidden = true })<CR>
nnoremap <Leader>ff :lua require('telescope.builtin').find_files({ hidden = true })<CR>
nnoremap <leader>fg :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>
nnoremap <leader>fr :lua require('telescope.builtin').grep_string { search = vim.fn.expand("<cword>") }<CR>
nnoremap <leader>fb :lua require('telescope.builtin').buffers()<CR>
nnoremap <leader>vh :lua require('telescope.builtin').help_tags()<CR>
nnoremap <leader>fd :lua require('nvimlua.telescope').search_dotfiles()<CR>
nnoremap <leader>fn :lua require('nvimlua.telescope').search_notes()<CR>
nnoremap <leader>fB :lua require('nvimlua.telescope').git_branches()<CR>
