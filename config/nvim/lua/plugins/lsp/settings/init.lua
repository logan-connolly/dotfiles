local lspconfig = require('lspconfig')
local lsp_status = require('lsp-status')
local lspkind = require('lspkind')
local saga = require('lspsaga')

-- local lsp settings
local python = require('plugins.lsp.settings.python')
local sumneko = require('plugins.lsp.settings.sumneko')

-- Adds VSCode like pictograms
lspkind.init()

-- setup saga which improves LSP hover window
saga.init_lsp_saga {
  use_saga_diagnostic_sign = false,
  finder_action_keys = {
    vsplit = "v",
    split = "s",
    quit = { "q", "ESC" },
  }
}

-- Configure linting diagnostics
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
vim.lsp.diagnostic.on_publish_diagnostics, {
  virtual_text = false,
  underline = false,
}
)

-- setup compe for completion
require'compe'.setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 1;
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 200;
  resolve_timeout = 800;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = true;

  source = {
    path = true;
    buffer = true;
    calc = true;
    nvim_lsp = true;
    nvim_lua = true;
    vsnip = false;
    ultisnips = false;
  };
}

-- LSP servers to support with optional arguments
local servers = {
  tsserver = {},
  vuels = {},
  pyright = python.settings,
  sumneko_lua = sumneko.settings
}

-- Configure each LSP by attaching completion and status capbilities
for server, config in pairs(servers) do
  config.capabilities = vim.tbl_deep_extend(
  'keep', config.capabilities or {}, lsp_status.capabilities
  )
  lspconfig[server].setup(config)
end
