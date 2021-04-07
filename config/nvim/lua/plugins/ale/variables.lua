local fixers = {
  css = {'prettier'},
  html = {'prettier'},
  javascript = {'prettier'},
  json = {'prettier'},
  markdown = {'textlint'},
  python = {'black'},
  sh = {'shfmt'},
  typescript = {'prettier'},
  vue = {'prettier'},
  yaml = {'prettier'},
}

local linters = {
  css = {'stylelint'},
  html = {'htmlhint'},
  javascript = {'eslint', 'prettier'},
  markdown = {'textlint'},
  python = {'flake8', 'pylint', 'mypy'},
  typescript = {'eslint', 'tsserver', 'prettier'},
  vue = {'eslint', 'prettier'},
}

Variable.g({
  ale_fix_on_save = 1,
  ale_sign_column_always = 1,
  ale_completion_enabled = 0,
  ale_python_pylint_change_directory = 0,
  ale_python_mypy_options = '--ignore-missing-imports .',
  ale_sign_error = '✖',
  ale_sign_warning = '⚠',
  ale_sign_info = '.',
  ale_fixers = fixers,
  ale_linters = linters,
})
