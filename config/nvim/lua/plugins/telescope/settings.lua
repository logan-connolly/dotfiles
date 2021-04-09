local actions = require('telescope.actions')
require('telescope').setup {
	defaults = {
		file_sorter      = require('telescope.sorters').get_fzy_sorter,
		file_previewer   = require('telescope.previewers').vim_buffer_cat.new,
		grep_previewer   = require('telescope.previewers').vim_buffer_vimgrep.new,
		qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,

		layout_defaults = {
			horizontal = {
				preview_width = 0.6,
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

require('telescope').load_extension('fzy_native')

local M = {}

M.search_dotfiles = function()
    require("telescope.builtin").find_files({
        prompt_title = "< Dotfiles >",
        cwd = "$HOME/github/dotfiles",
    })
end

M.search_notes = function()
    require("telescope.builtin").find_files({
        prompt_title = "< Notes >",
        cwd = "$HOME/notes",
    })
end

M.git_branches = function()
    require("telescope.builtin").git_branches({
        attach_mappings = function(prompt_bufnr, map)
            map('i', '<c-d>', actions.git_delete_branch)
            map('n', '<c-d>', actions.git_delete_branch)
            return true
        end
    })
end

return M
