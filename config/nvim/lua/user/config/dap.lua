local dap_ok, dap = pcall(require, "dap")
local dapui_ok, dapui = pcall(require, "dapui")

if not dap_ok or not dapui_ok then
  vim.notify("Unable to load dap config")
  return
end

-- icon settings
vim.fn.sign_define('DapBreakpoint', {text='🔴', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapStopped', {text='🟢', texthl='', linehl='', numhl=''})

-- event hooks
dap.listeners.after.event_initialized["dapui_config"] = function() dapui.open() end
dap.listeners.before.event_terminated["dapui_config"] = function() dapui.close() end
dap.listeners.before.event_exited["dapui_config"] = function() dapui.close() end

-- keymaps
vim.keymap.set("n", "<F5>", function() dap.continue() end)
vim.keymap.set("n", "<F3>", function() dap.step_over() end)
vim.keymap.set("n", "<F2>", function() dap.step_into() end)
vim.keymap.set("n", "<F12>", function() dap.step_out() end)
vim.keymap.set("n", "<leader>b", function() dap.toggle_breakpoint() end)
vim.keymap.set("n", "<leader>B", function() dap.set_breakpoint(vim.fn.input('❔:')) end)
vim.keymap.set("n", "<leader>do", function() dapui.toggle() end)

-- python
local dap_py_ok, dap_py = pcall(require, "dap-python")
if dap_py_ok then
  dap_py.setup('~/.local/opt/debugpy/bin/python')
  dap_py.test_runner = 'pytest'
  vim.keymap.set("n", "<leader>dp", function() dap_py.test_method() end)
end

-- golang
local dap_go_ok, dap_go = pcall(require, "dap-go")
if dap_go_ok then
  dap_go.setup()
  vim.keymap.set("n", "<leader>dg", function() dap_go.debug_test() end)
end
