nmap <F7> :ALEFix<CR>

let g:ale_linters = {
      \   'python': ['flake8', 'pylint', 'mypy'],
      \    'javascript': ['eslint', 'prettier'],
      \    'typescript': ['eslint', 'tsserver', 'prettier'],
      \}

let g:ale_fixers = {
      \    '*': ['remove_trailing_lines', 'trim_whitespace'],
      \    'python': ['isort', 'black'],
      \    'javascript': ['eslint', 'prettier'],
      \    'typescript': ['eslint', 'prettier'],
      \}

let g:ale_fix_on_save = 1
let g:ale_sign_column_always = 1
let g:ale_completion_enabled = 0

let g:ale_python_pylint_change_directory = 0
let g:ale_python_mypy_options = '--ignore-missing-imports .'
let g:ale_python_isort_options = '-p app -p tests'
