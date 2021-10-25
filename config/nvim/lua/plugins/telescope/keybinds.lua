local B = [['telescope.builtin'.]]
local S = [['plugins.telescope.setup'.]]
local E = [['telescope'.extensions.]]
local defaults = { noremap = true, silent = true }

local function cmd(module, fn)
  return '<Cmd>lua require' .. module .. fn .. ' <CR>'
end

Keybind.g({
  -- search files
  { 'n', '<Leader>ff', cmd(B, "find_files({ hidden = true })"), defaults },
  { 'n', '<C-p>', cmd(B, 'git_files({ hidden = true })'), defaults },

  -- search word
  { 'n', '<Leader>fg', cmd(B, "grep_string({ search = vim.fn.input('> ') })"), defaults },

  -- tpope/vim-vinegar replacement
  { 'n', '-', cmd(B, "file_browser({ cwd = require'telescope.utils'.buffer_dir() })"), defaults },

  -- search buffers
  { 'n', '<Leader>fb', cmd(B, 'buffers()'), defaults },

  -- search help pages
  { 'n', '<Leader>fh', cmd(B, 'help_tags()'), defaults },

  -- search projects
  { 'n', '<Leader>fp', cmd(E, 'project.project{}'), defaults },

  -- custom searches
  { 'n', '<Leader>fd', cmd(S, 'search_dotfiles()'), defaults },
  { 'n', '<Leader>fP', cmd(S, 'search_plugins()'), defaults },

  -- browse directory custom dirs
  { 'n', '<Leader>fn', cmd(S, 'browse_dir("~/notes")'), defaults },

  -- todo search
  { 'n', '<Leader>ft', '<cmd>TodoTelescope<CR>', defaults }
})
