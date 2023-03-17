local M = {
	"mfussenegger/nvim-dap",
	dependencies = {
		{ "theHamsta/nvim-dap-virtual-text", config = true },
		{ "leoluz/nvim-dap-go", config = true },
		{ "ofirgall/goto-breakpoints.nvim" },
		{
			"mfussenegger/nvim-dap-python",
			config = function()
				local bin = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
				require("dap-python").setup(bin)
				require("dap-python").test_runner = "pytest"
			end,
		},
		{
			"rcarriga/nvim-dap-ui",
			config = function()
				require("dapui").setup({
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
			end,
		},
	},
}

function M.init()
	vim.keymap.set("n", "<leader>b", function()
		require("dap").toggle_breakpoint()
	end, { desc = "Toggle Breakpoint" })

	vim.keymap.set("n", "<leader>B", function()
		require("dap").set_breakpoint(vim.fn.input("condition:"))
	end)

	vim.keymap.set("n", "<F5>", function()
		require("dap").continue()
	end, { desc = "Continue" })

	vim.keymap.set("n", "<F4>", function()
		require("dap").disconnect()
	end, { desc = "Disconnect" })

	vim.keymap.set("n", "<F3>", function()
		require("dap").step_over()
	end, { desc = "Step Over" })

	vim.keymap.set("n", "<F2>", function()
		require("dap").step_into()
	end, { desc = "Step Into" })

	vim.keymap.set("n", "<leader>dn", function()
		require("goto-breakpoints").next()
	end, { desc = "Next breakpoint" })

	vim.keymap.set("n", "<leader>dN", function()
		require("goto-breakpoints").prev()
	end, { desc = "Prev breakpoint" })

	vim.keymap.set("n", "<leader>dk", function()
		require("dap.ui.widgets").hover()
	end, { desc = "Widgets" })

	vim.keymap.set("n", "<leader>dr", function()
		require("dap").repl.open()
	end, { desc = "Repl" })

	vim.keymap.set("n", "<leader>do", function()
		require("dapui").toggle({})
	end, { desc = "Dap UI" })

	vim.keymap.set("n", "<leader>dx", function()
		require("dapui").close()
	end, { desc = "Dap UI" })

	vim.keymap.set("n", "<leader>dl", function()
		require("dap").run_last()
	end, { desc = "Rerun" })

	vim.keymap.set("n", "<leader>de", function()
		require("dap").set_exception_breakpoints({ "userUnhandled" })
		vim.notify("⚡ Break on unhandled exceptions!")
	end, { desc = "Catch unexpected" })

	vim.keymap.set("n", "<leader>dE", function()
		require("dap").set_exception_breakpoints({ "raised", "userUnhandled" })
		vim.notify("⚡⚡ Break on handled and uncaught exceptions!")
	end, { desc = "Catch handled and unhandled" })
end

function M.config()
	local dap = require("dap")
	local dapui = require("dapui")
	local icons = require("user.core.config").icons

	vim.fn.sign_define(
		"DapBreakpoint",
		{ text = icons.debug.bug, texthl = "DiagnosticSignError", linehl = "", numhl = "" }
	)
	vim.fn.sign_define(
		"DapStopped",
		{ text = icons.debug.position, texthl = "DiagnosticSignWarn", linehl = "Visual", numhl = "DiagnosticSignWarn" }
	)
	vim.fn.sign_define(
		"DapBreakpointCondition",
		{ text = icons.debug.bug, texthl = "DiagnosticSignWarn", linehl = "", numhl = "" }
	)

	dap.listeners.after.event_initialized["dapui_config"] = function()
		dapui.open(1)
	end
	dap.listeners.before.event_terminated["dapui_config"] = function()
		dapui.close({})
	end
	dap.listeners.before.event_exited["dapui_config"] = function()
		dapui.close({})
	end

	-- add autocomplete for dap repl
	vim.api.nvim_create_autocmd(
		{ "Filetype" },
		{ pattern = { "dap-repl" }, command = [[lua require('dap.ext.autocompl').attach()]] }
	)
end

return M
