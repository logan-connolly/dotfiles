local telescope_ok, telescope = pcall(require, 'telescope')
if not telescope_ok then
  vim.notify("Unable to load telescope config")
  return
end

local utils = require('telescope.utils')
local builtin = require('telescope.builtin')
local actions = require('telescope.actions')
local action_layout = require('telescope.actions.layout')
local sorters = require('telescope.sorters')
local previewers = require('telescope.previewers')

telescope.setup {
  defaults = {
    file_sorter      = sorters.get_fzy_sorter,
    file_previewer   = previewers.vim_buffer_cat.new,
    grep_previewer   = previewers.vim_buffer_vimgrep.new,
    qflist_previewer = previewers.vim_buffer_qflist.new,

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
      '.direnv/',
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
  pickers = {
    buffers = { theme = "dropdown" },
    find_files = { theme = "dropdown" },
    git_files = { theme = "dropdown" },
    grep_string = { theme = "dropdown" },
    treesitter = { theme = "dropdown" },
  },
  extensions = {
    fzy_native = {
      override_generic_sorter = true,
      override_file_sorter = true,
    },
    file_browser = {
      theme = "dropdown",
    }
  }
}

-- Load extensions
telescope.load_extension('fzy_native')
telescope.load_extension('file_browser')

-- builtin
vim.keymap.set('n', '<leader>ff', function() builtin.find_files({ hidden = true }) end)
vim.keymap.set('n', '<c-p>', function() builtin.git_files({ hidden = true }) end)
vim.keymap.set('n', '<leader>fw', function() builtin.grep_string({ search = vim.fn.input('🔎 ') }) end)
vim.keymap.set('n', '<leader>fb', function() builtin.buffers() end)
vim.keymap.set('n', '<leader>fh', function() builtin.help_tags() end)
vim.keymap.set('n', '<leader>fk', function() builtin.keymaps() end)
vim.keymap.set('n', '<leader>fg', function() builtin.git_status() end)
vim.keymap.set('n', '<leader>fl', function() builtin.git_commits() end)
vim.keymap.set('n', '<leader>fn', function() builtin.treesitter() end)

-- file browser
vim.keymap.set('n', '-', function()
  telescope.extensions.file_browser.file_browser({ cwd = utils.buffer_dir() })
end)