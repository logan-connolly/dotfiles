-- based on: https://github.com/crivotz/nv-ide
local vi_mode_utils_ok, vi_mode_utils = pcall(require, "feline.providers.vi_mode")
local devicons_ok, devicons = pcall(require, "nvim-web-devicons")

if not vi_mode_utils_ok or not devicons_ok then
	vim.notify("Unable to load feline config")
	return
end

local force_inactive = {
	filetypes = {},
	buftypes = {},
	bufnames = {},
}

local components = {
	active = { {}, {}, {} },
	inactive = { {}, {}, {} },
}

local colors = {
	bg = "#282828",
	black = "#282828",
	grey = "#292929",
	yellow = "#d8a657",
	cyan = "#89b482",
	oceanblue = "#45707a",
	green = "#a9b665",
	orange = "#e78a4e",
	violet = "#d3869b",
	magenta = "#c14a4a",
	white = "#a89984",
	fg = "#a89984",
	skyblue = "#7daea3",
	red = "#ea6962",
}

local vi_mode_colors = {
	NORMAL = "green",
	OP = "green",
	INSERT = "skyblue",
	CONFIRM = "red",
	VISUAL = "orange",
	LINES = "orange",
	BLOCK = "orange",
	REPLACE = "red",
	["V-REPLACE"] = "red",
	ENTER = "cyan",
	MORE = "cyan",
	SELECT = "orange",
	COMMAND = "green",
	SHELL = "green",
	TERM = "green",
	NONE = "yellow",
}

local vi_mode_text = {
	NORMAL = "<|",
	OP = "<|",
	INSERT = "|>",
	VISUAL = "<>",
	LINES = "<>",
	BLOCK = "<>",
	REPLACE = "<>",
	["V-REPLACE"] = "<>",
	ENTER = "<>",
	MORE = "<>",
	SELECT = "<>",
	COMMAND = "<|",
	SHELL = "<|",
	TERM = "<|",
	NONE = "<>",
	CONFIRM = "|>",
}

force_inactive.filetypes = {
	"packer",
}

force_inactive.buftypes = {
	"terminal",
}

-- STATUSLINE: bottom statusbar

-- LEFT

-- vi-mode
components.active[1][1] = {
	provider = function()
		return vi_mode_utils.get_vim_mode()
	end,
	hl = function()
		local val = {}
		val.fg = vi_mode_utils.get_mode_color()
		val.bg = "black"
		val.style = "bold"
		return val
	end,
	left_sep = " ",
	right_sep = " ",
}
-- vi-symbol
components.active[1][2] = {
	provider = function()
		return vi_mode_text[vi_mode_utils.get_vim_mode()]
	end,
	hl = function()
		local val = {}
		val.fg = vi_mode_utils.get_mode_color()
		val.bg = "bg"
		val.style = "bold"
		return val
	end,
	right_sep = "  ",
}
-- filename
components.active[1][3] = {
	provider = function()
		return vim.fn.expand("%:t")
	end,
	hl = {
		fg = "white",
		bg = "bg",
		style = "bold",
	},
	right_sep = "  ",
}

-- gitBranch
components.active[1][4] = {
	provider = "git_branch",
	hl = {
		fg = "yellow",
		bg = "bg",
		style = "bold",
	},
	right_sep = " ",
}
-- diffAdd
components.active[1][5] = {
	provider = "git_diff_added",
	hl = {
		fg = "green",
		bg = "bg",
		style = "bold",
	},
}
-- diffModfified
components.active[1][6] = {
	provider = "git_diff_changed",
	hl = {
		fg = "orange",
		bg = "bg",
		style = "bold",
	},
}
-- diffRemove
components.active[1][7] = {
	provider = "git_diff_removed",
	hl = {
		fg = "red",
		bg = "bg",
		style = "bold",
	},
}

-- MID

-- RIGHT

-- fileIcon
components.active[3][1] = {
	provider = function()
		local filename = vim.fn.expand("%:t")
		local extension = vim.fn.expand("%:e")
		local icon = devicons.get_icon(filename, extension)
		if icon == nil then
			icon = ""
		end
		return icon
	end,
	hl = function()
		local val = {}
		local filename = vim.fn.expand("%:t")
		local extension = vim.fn.expand("%:e")
		local icon, name = devicons.get_icon(filename, extension)
		if icon ~= nil then
			val.fg = vim.fn.synIDattr(vim.fn.hlID(name), "fg")
		else
			val.fg = "white"
		end
		val.bg = "bg"
		val.style = "bold"
		return val
	end,
	right_sep = " ",
}
-- fileType
components.active[3][2] = {
	provider = "file_type",
	hl = function()
		local val = {}
		local filename = vim.fn.expand("%:t")
		local extension = vim.fn.expand("%:e")
		local icon, name = devicons.get_icon(filename, extension)
		if icon ~= nil then
			val.fg = vim.fn.synIDattr(vim.fn.hlID(name), "fg")
		else
			val.fg = "white"
		end
		val.bg = "bg"
		val.style = "bold"
		return val
	end,
	right_sep = "  ",
}
-- fileSize
components.active[3][3] = {
	provider = "file_size",
	enabled = function()
		return vim.fn.getfsize(vim.fn.expand("%:t")) > 0
	end,
	hl = {
		fg = "skyblue",
		bg = "bg",
		style = "bold",
	},
	right_sep = " ",
}
components.active[3][4] = {
	provider = "position",
	hl = {
		fg = "white",
		bg = "bg",
		style = "bold",
	},
	right_sep = " ",
}
-- linePercent
components.active[3][5] = {
	provider = "line_percentage",
	hl = {
		fg = "white",
		bg = "bg",
		style = "bold",
	},
	right_sep = " ",
}
-- scrollBar
components.active[3][6] = {
	provider = "scroll_bar",
	hl = {
		fg = "yellow",
		bg = "bg",
	},
}

require("feline").setup({
	theme = colors,
	default_bg = colors.bg,
	default_fg = colors.fg,
	vi_mode_colors = vi_mode_colors,
	components = components,
	force_inactive = force_inactive,
})
