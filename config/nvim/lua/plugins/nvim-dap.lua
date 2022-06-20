-- general dap settings
local dap = require("dap")
require("nvim-dap-virtual-text").setup()
require("dapui").setup()

vim.keymap.set("n", "<F5>", function() dap.continue() end)
vim.keymap.set("n", "<F3>", function() dap.step_over() end)
vim.keymap.set("n", "<F2>", function() dap.step_into() end)
vim.keymap.set("n", "<F12>", function() dap.step_out() end)
vim.keymap.set("n", "<leader>b", function() dap.toggle_breakpoint() end)
vim.keymap.set("n", "<leader>B", function() dap.set_breakpoint(vim.fn.input('❔:')) end)
vim.keymap.set("n", "<leader>do", function() require("dapui").toggle() end)

vim.fn.sign_define('DapBreakpoint', {text='🔴', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapStopped', {text='🟢', texthl='', linehl='', numhl=''})

-- python settings
local dap_py = require("dap-python")
dap_py.setup('~/.local/opt/debugpy/bin/python')
dap_py.test_runner = 'pytest'
vim.keymap.set("n", "<leader>dp", function() dap_py.test_method() end)

-- golang settings
local dap_go = require("dap-go")
dap_go.setup()
vim.keymap.set("n", "<leader>dg", function() dap_go.debug_test() end)
