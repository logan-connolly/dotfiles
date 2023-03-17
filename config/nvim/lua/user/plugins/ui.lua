return {
	-- colorscheme
	{
		"wittyjudge/gruvbox-material.nvim",
		lazy = false, -- make sure we load this during startup if it is your main colorscheme
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()
			-- transparent background
			vim.api.nvim_create_autocmd({ "ColorScheme" }, {
				pattern = { "*" },
				command = [[hi Normal ctermbg=none guibg=none | hi NonText ctermbg=NONE guibg=NONE | hi EndOfBuffer ctermbg=NONE guibg=NONE]],
			})

			vim.cmd("colorscheme gruvbox-material")
		end,
	},

	-- noice notifier
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {
			lsp = {
				-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
					["cmp.entry.get_documentation"] = true,
				},
			},
			-- you can enable a preset for easier configuration
			presets = {
				bottom_search = true, -- use a classic bottom cmdline for search
				command_palette = true, -- position the cmdline and popupmenu together
				long_message_to_split = true, -- long messages will be sent to a split
				inc_rename = false, -- enables an input dialog for inc-rename.nvim
				lsp_doc_border = false, -- add a border to hover docs and signature help
			},
		},
		-- stylua: ignore
		keys = {
			{ "<leader>nl", function() require("noice").cmd("last") end, desc = "Show last notification" },
			{ "<leader>nh", function() require("noice").cmd("history") end, desc = "Show notification history" },
		},
	},

	-- better vim.ui
	{
		"stevearc/dressing.nvim",
		init = function()
			---@diagnostic disable-next-line: duplicate-set-field
			vim.ui.select = function(...)
				require("lazy").load({ plugins = { "dressing.nvim" } })
				return vim.ui.select(...)
			end
			---@diagnostic disable-next-line: duplicate-set-field
			vim.ui.input = function(...)
				require("lazy").load({ plugins = { "dressing.nvim" } })
				return vim.ui.input(...)
			end
		end,
	},

	-- icons
	{ "nvim-tree/nvim-web-devicons" },

	-- ui components
	{ "MunifTanjim/nui.nvim" },

	-- dashboard
	{
		"goolord/alpha-nvim",
		event = "VimEnter",
		opts = function()
			local dashboard = require("alpha.themes.dashboard")
			local header = {
				[[███    ██ ███████  ██████  ██    ██ ██ ███    ███]],
				[[████   ██ ██      ██    ██ ██    ██ ██ ████  ████]],
				[[██ ██  ██ █████   ██    ██ ██    ██ ██ ██ ████ ██]],
				[[██  ██ ██ ██      ██    ██  ██  ██  ██ ██  ██  ██]],
				[[██   ████ ███████  ██████    ████   ██ ██      ██]],
			}

			dashboard.section.header.val = header
			dashboard.section.buttons.val = {
				dashboard.button("n", " " .. " New file", ":ene <BAR> startinsert <CR>"),
				dashboard.button("r", " " .. " Recent files", ":Telescope oldfiles <CR>"),
				dashboard.button("l", "鈴" .. " Lazy", ":Lazy<CR>"),
				dashboard.button("q", " " .. " Quit", ":qa<CR>"),
			}
			for _, button in ipairs(dashboard.section.buttons.val) do
				button.opts.hl = "AlphaButtons"
				button.opts.hl_shortcut = "AlphaShortcut"
			end
			dashboard.section.footer.opts.hl = "Type"
			dashboard.section.header.opts.hl = "AlphaHeader"
			dashboard.section.buttons.opts.hl = "AlphaButtons"
			dashboard.opts.layout[1].val = 6
			return dashboard
		end,
		config = function(_, dashboard)
			vim.b.miniindentscope_disable = true

			-- close Lazy and re-open when the dashboard is ready
			if vim.o.filetype == "lazy" then
				vim.cmd.close()
				vim.api.nvim_create_autocmd("User", {
					pattern = "AlphaReady",
					callback = function()
						require("lazy").show()
					end,
				})
			end

			require("alpha").setup(dashboard.opts)

			vim.api.nvim_create_autocmd("User", {
				pattern = "VeryLazy",
				callback = function()
					local stats = require("lazy").stats()
					local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
					dashboard.section.footer.val = "⚡ Neovim loaded " .. stats.count .. " plugins in " .. ms .. "ms"
					pcall(vim.cmd.AlphaRedraw)
				end,
			})
		end,
	},

	-- status line
	{
		"feline-nvim/feline.nvim",
		event = "VeryLazy",
		config = function()
			local vi_mode_utils = require("feline.providers.vi_mode")
			local devicons = require("nvim-web-devicons")

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
		end,
	},
}
