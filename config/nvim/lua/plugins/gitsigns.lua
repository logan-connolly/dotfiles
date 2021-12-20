require('gitsigns').setup {
  signs = {
    add          = {hl = 'GitSignsAdd'   , text = '│', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'},
    change       = {hl = 'GitSignsChange', text = '│', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
    delete       = {hl = 'GitSignsDelete', text = '_', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
    topdelete    = {hl = 'GitSignsDelete', text = '‾', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
    changedelete = {hl = 'GitSignsChange', text = '~', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
  },
  signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
  numhl      = false, -- Toggle with `:Gitsigns toggle_numhl`
  linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
  word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
  keymaps = {
    -- Default keymap options
    noremap = true,

    ['n ]c'] = { expr = true, "&diff ? ']c' : '<cmd>lua require\"gitsigns.actions\".next_hunk()<cr>'"},
    ['n [c'] = { expr = true, "&diff ? '[c' : '<cmd>lua require\"gitsigns.actions\".prev_hunk()<cr>'"},

    ['n <leader>hs'] = '<cmd>lua require"gitsigns".stage_hunk()<cr>',
    ['v <leader>hs'] = '<cmd>lua require"gitsigns".stage_hunk({vim.fn.line("."), vim.fn.line("v")})<cr>',
    ['n <leader>hu'] = '<cmd>lua require"gitsigns".undo_stage_hunk()<cr>',
    ['n <leader>hr'] = '<cmd>lua require"gitsigns".reset_hunk()<cr>',
    ['v <leader>hr'] = '<cmd>lua require"gitsigns".reset_hunk({vim.fn.line("."), vim.fn.line("v")})<cr>',
    ['n <leader>hR'] = '<cmd>lua require"gitsigns".reset_buffer()<cr>',
    ['n <leader>hp'] = '<cmd>lua require"gitsigns".preview_hunk()<cr>',
    ['n <leader>hb'] = '<cmd>lua require"gitsigns".blame_line{full=true}<cr>',
    ['n <leader>hB'] = '<cmd>lua require"gitsigns".toggle_current_line_blame()<cr>',
    ['n <leader>hS'] = '<cmd>lua require"gitsigns".stage_buffer()<cr>',
    ['n <leader>hU'] = '<cmd>lua require"gitsigns".reset_buffer_index()<cr>',

    -- Text objects
    ['o ih'] = ':<c-U>lua require"gitsigns.actions".select_hunk()<cr>',
    ['x ih'] = ':<c-U>lua require"gitsigns.actions".select_hunk()<cr>'
  },
  watch_gitdir = {
    interval = 1000,
    follow_files = true
  },
  attach_to_untracked = true,
  current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
    delay = 1000,
    ignore_whitespace = false,
  },
  current_line_blame_formatter_opts = {
    relative_time = false
  },
  sign_priority = 6,
  update_debounce = 100,
  status_formatter = nil, -- Use default
  max_file_length = 40000,
  preview_config = {
    border = 'single',
    style = 'minimal',
    relative = 'cursor',
    row = 0,
    col = 1
  },
  yadm = {
    enable = false
  },
}
