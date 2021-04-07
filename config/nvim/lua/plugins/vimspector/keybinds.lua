local defaults = { noremap = true, silent = true }

Keybind.g({
	-- general
	{ 'n', '<Leader>m', [[<Cmd>MaximizerToggle!<CR>]], defaults },
	-- outside debugger
	{ 'n', '<Leader>dd', [[<Cmd>call vimspector#Launch()<CR>]], defaults },
	{ 'n', '<Leader>dx', [[<Cmd>call vimspector#Reset()<CR>]], defaults },
	{ 'n', '<Leader>dc', [[<Cmd>call vimspector#Continue()<CR>]], defaults },
	{ 'n', '<Leader>da', [[<Cmd>call vimspector#ClearBreakpoints()<CR>]], defaults },
	-- inside debugger
	{ 'n', '<Leader>dl', [[<Plug>VimspectorStepInto]], { noremap = true, silent = true } },
	{ 'n', '<Leader>dl', [[<Plug>VimspectorStepOver]], { noremap = true, silent = true } },
	{ 'n', '<Leader>dl', [[<Plug>VimspectorStepOut]], { noremap = true, silent = true } },
	{ 'n', '<Leader>dl', [[<Plug>VimspectorRestart]], { noremap = true, silent = true } },
	{ 'n', '<Leader>dl', [[<Plug>VimspectorToggleBreakpoint]], { noremap = true, silent = true } },
	{ 'n', '<Leader>dl', [[<Plug>VimspectorToggleConditionalBreakpoint]], { noremap = true, silent = true } },
})
