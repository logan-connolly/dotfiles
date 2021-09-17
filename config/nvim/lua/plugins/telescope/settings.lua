local actions = require('telescope.actions')

require('telescope').setup {
  defaults = {
    file_sorter      = require('telescope.sorters').get_fzy_sorter,
    file_previewer   = require('telescope.previewers').vim_buffer_cat.new,
    grep_previewer   = require('telescope.previewers').vim_buffer_vimgrep.new,
    qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,
    layout_strategy = "flex",

    layout_config = {
      horizontal = {
        preview_width = 0.6,
      },
      vertical = {
        preview_height = 0.5,
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
    },
  }
}

-- Load extensions
require('telescope').load_extension('fzy_native')

-- Custom functions
local search_dir = function(name, path)
  require("telescope.builtin").find_files({
    prompt_title = "< " .. name .. " >",
    cwd = path,
    hidden = true,
  })
end

local M = {}

M.search_dotfiles = function() search_dir("dotfiles", "~/projects/dotfiles") end
M.search_plugins = function() search_dir("plugins", "~/.local/share/nvim/site/pack/paqs/start") end

M.browse_dir = function(path)
  require("telescope.builtin").file_browser({
    cwd = path,
    hidden = true,
  })
end

return M
