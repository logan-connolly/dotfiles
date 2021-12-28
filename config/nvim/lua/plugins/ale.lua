require 'paq' {
  'dense-analysis/ale';
}

local fixers = {
  ['*'] = {'remove_trailing_lines', 'trim_whitespace'},
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
local linters = { html = {'htmlhint'}}

vim.g.ale_fix_on_save = 1
vim.g.ale_disable_lsp = 1
vim.g.ale_completion_enabled = 0
vim.g.ale_fixers = fixers
vim.g.ale_linters = linters
vim.g.ale_lint_on_text_changed = 0
vim.g.ale_lint_on_insert_leave = 0
vim.g.ale_lint_on_enter = 0
vim.g.ale_lint_on_save = 0
vim.g.ale_lint_on_filetype_changed = 0
