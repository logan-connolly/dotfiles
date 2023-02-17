M = {}

-- Auto detect virtual environment
local function get_python_path(workspace)
	local path = require("lspconfig.util").path
	-- Use activated virtualenv.
	if vim.env.VIRTUAL_ENV then
		return path.join(vim.env.VIRTUAL_ENV, "bin", "python")
	end

	-- Find and use virtualenv in workspace directory.
	for _, pattern in ipairs({ "*", ".*" }) do
		local match = vim.fn.glob(path.join(workspace, pattern, "pyvenv.cfg"))
		print(match)
		if match ~= "" then
			return path.join(path.dirname(match), "bin", "python")
		end
	end

	-- Fallback to system Python.
	return exepath("python3") or exepath("python") or "python"
end

M.python = {
	before_init = function(_, config)
		config.settings.python.pythonPath = get_python_path(config.root_dir)
		vim.keymap.set("n", "<leader>td", function()
			require("dap-python").test_method()
		end)
	end,
}

M.golang = {
	before_init = function(_, config)
		vim.keymap.set("n", "<leader>td", function()
			require("dap-go").debug_test()
		end)
	end,
}

M.lua = {
	settings = {
		Lua = {
			runtime = { version = "LuaJIT" },
			diagnostics = { globals = { "vim" } },
			workspace = { library = vim.api.nvim_get_runtime_file("", true), checkThirdParty = false },
			telemetry = { enable = false },
		},
	},
}

return M
