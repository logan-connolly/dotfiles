require 'paq' {
  'mfussenegger/nvim-dap';
  'mfussenegger/nvim-dap-python';
}

local dap = require('dap')
local opt = os.getenv('HOME') .. '/.local/opt'

vim.fn.sign_define('DapBreakpoint', {text='🔴', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapStopped', {text='🟢', texthl='', linehl='', numhl=''})

-- python (debugpy extension)
require('dap-python').setup(opt .. '/debugpy/bin/python')
require('dap-python').test_runner = 'pytest'

-- javascript (node)
dap.adapters.node2 = {
  type = 'executable',
  command = 'node',
  args = {opt .. '/vscode-node-debug2/out/src/nodeDebug.js'}
}
dap.configurations.javascript = {
  {
    type = 'node2',
    request = 'launch',
    program = '${workspaceFolder}/${file}',
    cwd = vim.fn.getcwd(),
    sourceMaps = true,
    protocol = 'inspector',
    console = 'integratedTerminal',
  },
}

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

map('n', '<F3>', '<cmd>lua local d = require"dap"; d.disconnect(); d.close()<cr>', opts)
map('n', '<F5>', '<cmd>lua require"dap".continue()<cr>', opts)
map('n', '<F10>', '<cmd>lua require"dap".step_over()<cr>', opts)
map('n', '<F11>', '<cmd>lua require"dap".step_into()<cr>', opts)
map('n', '<F12>', '<cmd>lua require"dap".step_out()<cr>', opts)
map('n', '<leader>b', '<cmd>lua require"dap".toggle_breakpoint()<cr>', opts)
map('n', '<leader>B', '<cmd>lua require"dap".toggle_breakpoint(vim.fn.input("Breakpoint Condition: "), nil, nil, true)<cr>', opts)
map('n', '<leader>dr', '<cmd>lua require"dap".repl.toggle({height=15})<cr>', opts)
map('n', '<leader>dh', '<cmd>lua require"dap.ui.widgets".hover()<cr>', opts)
map('n', '<leader>dp', '<cmd>lua require"dap".run_to_cursor()<cr>', opts)
map('n', '<leader>dj', '<cmd>lua require"dap".down()<cr>', opts)
map('n', '<leader>dk', '<cmd>lua require"dap".up()<cr>', opts)
map('n', '<leader>dl', '<cmd>lua require"dap".run_last()<cr>', opts)
map('n', '<leader>dS', '<cmd>lua local w = require"dap.ui.widgets"; w.centered_float(w.frames)<cr>', opts)
map('n', '<leader>ds', '<cmd>lua local w = require"dap.ui.widgets"; w.centered_float(w.scopes)<cr>', opts)
map('n', 'df', '<cmd>lua require("dap-python").test_method()<cr>', {})
map('n', 'dc', '<cmd>lua require("dap-python").test_class()<cr>', {})
