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
