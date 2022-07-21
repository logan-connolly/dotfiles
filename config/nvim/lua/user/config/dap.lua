local dap_ok, dap = pcall(require, "dap")
local dapui_ok, dapui = pcall(require, "dapui")
local daptext_ok, daptext = pcall(require, "nvim-dap-virtual-text")

if not dap_ok or not dapui_ok or not daptext_ok then
	vim.notify("Unable to load dap config")
	return
end

dapui.setup({
	layouts = {
		{
			elements = { "console" },
			size = 0.20,
			position = "bottom",
		},
		{
			elements = { "repl" },
			size = 0.20,
			position = "bottom",
		},
	},
})
daptext.setup()

-- icon settings
vim.fn.sign_define("DapBreakpoint", { text = "🔴", texthl = "", linehl = "", numhl = "" })
vim.fn.sign_define("DapStopped", { text = "🟢", texthl = "", linehl = "", numhl = "" })

-- event hooks
dap.listeners.after.event_initialized["dapui_config"] = function()
	dapui.open(1)
end
dap.listeners.before.event_terminated["dapui_config"] = function()
	dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
	dapui.close()
end

-- keymaps
vim.keymap.set("n", "<F5>", function()
	dap.continue()
end)
vim.keymap.set("n", "<F4>", function()
	dap.terminate()
end)
vim.keymap.set("n", "<F3>", function()
	dap.step_over()
end)
vim.keymap.set("n", "<F2>", function()
	dap.step_into()
end)
vim.keymap.set("n", "<F12>", function()
	dap.step_out()
end)
vim.keymap.set("n", "<leader>b", function()
	dap.toggle_breakpoint()
end)
vim.keymap.set("n", "<leader>B", function()
	dap.set_breakpoint(vim.fn.input("❔:"))
end)
vim.keymap.set("n", "<leader>de", function()
	dap.set_exception_breakpoints({ "raised", "uncaught" })
	vim.notify("⚡ Exception breakpoints were set!")
end)
vim.keymap.set("n", "<leader>dk", function()
	require("dap.ui.widgets").hover()
end)
vim.keymap.set("n", "<leader>do", function()
	dapui.toggle()
end)
vim.keymap.set("n", "<leader>dx", function()
	dapui.close()
end)

-- python
local dap_py_ok, dap_py = pcall(require, "dap-python")
if dap_py_ok then
	dap_py.setup("~/.local/opt/debugpy/bin/python")
	dap_py.test_runner = "pytest"
	vim.keymap.set("n", "<leader>dp", function()
		dap_py.test_method()
	end)
end

-- golang
local dap_go_ok, dap_go = pcall(require, "dap-go")
if dap_go_ok then
	dap_go.setup()
	vim.keymap.set("n", "<leader>dg", function()
		dap_go.debug_test()
	end)
end
