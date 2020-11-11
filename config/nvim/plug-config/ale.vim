nmap <F7> :ALEFix<CR>

let g:ale_linters = {
      \   'python': ['flake8', 'pylint', 'mypy'],
      \}

let g:ale_fixers = {
      \    'python': ['isort', 'black'],
      \}

let g:ale_sign_column_always = 1
let g:ale_python_pylint_change_directory = 0
let g:ale_python_mypy_options = '--ignore-missing-imports .'
let g:ale_python_isort_options = '-p app -p tests'
