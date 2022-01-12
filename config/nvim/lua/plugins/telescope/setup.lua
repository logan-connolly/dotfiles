local actions = require('telescope.actions')
local action_layout = require "telescope.actions.layout"

require('telescope').setup {
  defaults = {

    file_sorter      = require('telescope.sorters').get_fzy_sorter,
    file_previewer   = require('telescope.previewers').vim_buffer_cat.new,
    grep_previewer   = require('telescope.previewers').vim_buffer_vimgrep.new,
    qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,

    winblend = 0,
    color_devicons = true,

    layout_strategy = 'horizontal',
    layout_config = {
      width = 0.95,
      height = 0.85,
      prompt_position = "top",
      horizontal = {
        preview_width = function(_, cols, _)
          if cols > 200 then
            return math.floor(cols * 0.4)
          else
            return math.floor(cols * 0.6)
          end
        end,
      },
      vertical = {
        width = 0.9,
        height = 0.95,
        preview_height = 0.5,
      },
      flex = {
        horizontal = {
          preview_width = 0.9,
        },
      },
    },

    file_ignore_patterns = {
      '.git/',
      '__pycache__/',
      'venv/',
      'node_modules/',
      'package-lock.json',
      'yarn.lock',
    },

    mappings = {
      i = {
        ['<c-q>'] = actions.send_to_qflist,
        ['<c-s>'] = action_layout.toggle_preview,
      },
    }
  },
  extensions = {
    fzy_native = {
      override_generic_sorter = true,
      override_file_sorter = true,
    }
  }
}

-- Load extensions
require('telescope').load_extension('fzy_native')
require('telescope').load_extension('file_browser')

-- Custom functions
local M = {}

M.search_plugins = function()
  require('telescope.builtin').find_files({
    prompt_title = '< plugins >',
    cwd = '~/.local/share/nvim/site/pack/paqs/start',
    hidden = true,
  })
end

return M
