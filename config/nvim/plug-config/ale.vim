nmap <F7> :ALEFix<CR>
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

let g:ale_linters = {
      \   'css': ['stylelint'],
      \   'html': ['htmlhint'],
      \   'javascript': ['eslint', 'prettier'],
      \   'markdown': ['textlint'],
      \   'python': ['flake8', 'pylint', 'mypy'],
      \   'typescript': ['eslint', 'tsserver', 'prettier'],
      \   'vue': ['eslint', 'prettier'],
      \}

let g:ale_fixers = {
      \   '*': ['remove_trailing_lines', 'trim_whitespace'],
      \   'css': ['prettier'],
      \   'html': ['prettier'],
      \   'javascript': ['prettier'],
      \   'json': ['prettier'],
      \   'markdown': ['textlint'],
      \   'python': ['isort', 'black'],
      \   'sh': ['shfmt'],
      \   'typescript': ['prettier'],
      \   'vue': ['prettier'],
      \   'yaml': ['prettier'],
      \}

let g:ale_fix_on_save = 1
let g:ale_sign_column_always = 1
let g:ale_completion_enabled = 0

let g:ale_python_pylint_change_directory = 0
let g:ale_python_mypy_options = '--ignore-missing-imports .'
let g:ale_python_isort_options = '-p app -p tests'

let g:ale_sign_error = '✖'
let g:ale_sign_warning = '⚠'
let g:ale_sign_info = '.'
