local fixers = {
  ["*"] = {'remove_trailing_lines', 'trim_whitespace'},
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

Variable.g({
  ale_fix_on_save = 1,
  ale_disable_lsp = 1,
  ale_completion_enabled = 0,
  ale_fixers = fixers,
  ale_linters = linters,
  ale_lint_on_text_changed = 0,
  ale_lint_on_insert_leave = 0,
  ale_lint_on_enter = 0,
  ale_lint_on_save = 0,
  ale_lint_on_filetype_changed = 0,
})
