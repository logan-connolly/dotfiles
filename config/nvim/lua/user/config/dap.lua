local dap_ok, dap = pcall(require, "dap")
local dapui_ok, dapui = pcall(require, "dapui")
local daptext_ok, daptext = pcall(require, "nvim-dap-virtual-text")
local dap_py_ok, dap_py = pcall(require, "dap-python")
local dap_go_ok, dap_go = pcall(require, "dap-go")

if not dap_ok or not dapui_ok or not daptext_ok or not dap_py_ok or not dap_go_ok then
	vim.notify("Unable to load dap config")
	return
end

dapui.setup({
	layouts = {
		{
			elements = {},
			size = 0,
			position = "bottom",
		},
		{
			elements = { "console" },
			size = 0.60,
			position = "bottom",
		},
	},
})
daptext.setup()
dap_go.setup()
dap_py.setup("~/.local/share/nvim/mason/packages/debugpy/venv/bin/python")
dap_py.test_runner = "pytest"

-- icon settings
vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "DiagnosticSignError", linehl = "", numhl = "" })
vim.fn.sign_define("DapStopped", { text = "", texthl = "DiagnosticSignWarn", linehl = "Visual", numhl = "DiagnosticSignWarn" })
vim.fn.sign_define("DapBreakpointCondition", { text = "", texthl = "DiagnosticSignWarn", linehl = "", numhl = "" })

-- event hooks
dap.listeners.after.event_initialized["dapui_config"] = function()
	dapui.open(1)
	vim.notify("🟢 Debug session initialized.", {}, { timeout = 3000 })
end
dap.listeners.before.event_terminated["dapui_config"] = function()
	vim.notify("🔴 Debug session terminated.")
end
dap.listeners.before.event_exited["dapui_config"] = function()
	vim.notify("🔴 Debug session terminated.")
end

-- keymaps
vim.keymap.set("n", "<F5>", function()
	dap.continue()
end)
vim.keymap.set("n", "<F4>", function()
	dap.disconnect()
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
	dap.set_breakpoint(vim.fn.input("condition:"))
end)
vim.keymap.set("n", "<leader>de", function()
	dap.set_exception_breakpoints({ "userUnhandled" })
	vim.notify("⚡ Break on unhandled exceptions!")
end)
vim.keymap.set("n", "<leader>dE", function()
	dap.set_exception_breakpoints({ "raised", "userUnhandled" })
	vim.notify("⚡⚡ Break on handled and uncaught exceptions!")
end)
vim.keymap.set("n", "<leader>dk", function()
	require("dap.ui.widgets").hover()
end)
vim.keymap.set("n", "<leader>do", function()
	dapui.toggle()
end)
vim.keymap.set("n", "<leader>dr", function()
	dap.repl.toggle()
end)
vim.keymap.set("n", "<leader>dl", function()
	dap.run_last()
end)
vim.keymap.set("n", "<leader>dx", function()
	dapui.close()
end)
