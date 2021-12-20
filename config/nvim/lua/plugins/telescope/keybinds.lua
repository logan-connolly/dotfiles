local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

local B = [['telescope.builtin'.]]
local S = [['plugins.telescope.setup'.]]
local E = [['telescope'.extensions.]]

local function cmd(module, fn)
  return '<Cmd>lua require' .. module .. fn .. ' <cr>'
end

map('n', '<leader>ff', cmd(B, "find_files({ hidden = true })"), opts)
map('n', '<c-p>', cmd(B, 'git_files({ hidden = true })'), opts)
map('n', '<leader>fw', cmd(B, "grep_string({ search = vim.fn.input('🔎 ') })"), opts)
map('n', '-', cmd(B, "file_browser({ cwd = require'telescope.utils'.buffer_dir() })"), opts)
map('n', '<leader>fb', cmd(B, 'buffers()'), opts)
map('n', '<leader>fh', cmd(B, 'help_tags()'), opts)
map('n', '<leader>fp', cmd(E, 'project.project{}'), opts)
map('n', '<leader>fd', cmd(S, 'search_dotfiles()'), opts)
map('n', '<leader>fP', cmd(S, 'search_plugins()'), opts)
map('n', '<leader>fn', cmd(S, 'browse_dir("~/notes")'), opts)
map('n', '<leader>ft', '<cmd>TodoTelescope<cr>', opts)
map('n', '<leader>fg', cmd(B, 'git_status()'), opts)
map('n', '<leader>fl', cmd(B, 'git_commits()'), opts)
map('n', '<leader>fB', cmd(B, 'git_branches()'), opts)
