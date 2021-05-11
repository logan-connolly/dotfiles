local actions = require('telescope.actions')

require('telescope').setup {
	defaults = {
		file_sorter      = require('telescope.sorters').get_fzy_sorter,
		file_previewer   = require('telescope.previewers').vim_buffer_cat.new,
		grep_previewer   = require('telescope.previewers').vim_buffer_vimgrep.new,
		qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,
		layout_strategy = "flex",

		layout_defaults = {
			horizontal = {
				preview_width = 0.6,
			},
			vertical = {
				preview_height = 0.5,
				height_padding = 1,
        width_padding = 0.05,
			}
		},

		file_ignore_patterns = {
			".git/",
			"__pycache__/",
			"venv/",
			"node_modules/",
		},

		mappings = {
			i = {
				["<C-q>"] = actions.send_to_qflist,
			},
		}
  },
	extensions = {
		fzy_native = {
		override_generic_sorter = false,
		override_file_sorter = true,
		}
	}
}

-- Load extensions
require('telescope').load_extension('fzy_native')
require('telescope').load_extension('project')

-- Custom functions
search_dir = function(name, path_from_home)
	require("telescope.builtin").find_files({
		prompt_title = "< " .. name .. " >",
		cwd = "$HOME/" .. path_from_home,
		hidden = true,
	})
end

local M = {}

M.search_dotfiles = function() search_dir("dotfiles", "dotfiles") end
M.search_notes = function() search_dir("notes", "notes") end
M.search_plugins = function() search_dir("plugins", ".local/share/nvim/site/pack/paqs/start") end

return M
