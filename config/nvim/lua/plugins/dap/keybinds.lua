local defaults = { noremap = true, silent = true }

Keybind.g({
  -- general
  { 'n', '<F3>', "<Cmd>lua local d = require'dap'; d.disconnect(); d.close()<CR>", defaults},
  { 'n', '<F5>', "<Cmd>lua require'dap'.continue()<CR>", defaults },
  { 'n', '<F10>', "<Cmd>lua require'dap'.step_over()<CR>", defaults },
  { 'n', '<F11>', "<Cmd>lua require'dap'.step_into()<CR>", defaults },
  { 'n', '<F12>', "<Cmd>lua require'dap'.step_out()<CR>", defaults },
  { 'n', '<leader>b', "<Cmd>lua require'dap'.toggle_breakpoint()<CR>", defaults },
  { 'n', '<leader>B', "<Cmd>lua require'dap'.toggle_breakpoint(vim.fn.input('Breakpoint Condition: '), nil, nil, true)<CR>", defaults },
  { 'n', '<leader>dr', "<Cmd>lua require'dap'.repl.toggle({height=15})<CR>", defaults },
  { 'n', '<leader>dh', "<Cmd>lua require'dap.ui.widgets'.hover()<CR>", defaults },
  { 'n', '<leader>dp', "<Cmd>lua require'dap'.run_to_cursor()<CR>", defaults },
  { 'n', '<leader>dj', "<Cmd>lua require'dap'.down()<CR>", defaults },
  { 'n', '<leader>dk', "<Cmd>lua require'dap'.up()<CR>", defaults },
  { 'n', '<leader>dl', "<Cmd>lua require'dap'.run_last()<CR>", defaults },
  { 'n', '<leader>dS', "<Cmd>lua local w = require'dap.ui.widgets'; w.centered_float(w.frames)<CR>", defaults },
  { 'n', '<leader>ds', "<Cmd>lua local w = require'dap.ui.widgets'; w.centered_float(w.scopes)<CR>", defaults },
  -- python
  { 'n', 'df', "<Cmd>lua require('dap-python').test_method()<CR>" },
  { 'n', 'dc', "<Cmd>lua require('dap-python').test_class()<CR>" },
})
