local lspconfig = require('lspconfig')
local lsp_status = require('lsp-status')
local lspkind = require('lspkind')
local saga = require('lspsaga')

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

-- Configure lua language server
local sumneko_root_path = '~/.local/opt/lua-language-server'
local sumneko_binary = '/usr/bin/lua-language-server'
local lua_settings = {
  cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"},
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
        -- Setup your lua path
        path = vim.split(package.path, ';')
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'}
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = {
          [vim.fn.expand('$VIMRUNTIME/lua')] = true,
          [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true
        }
      }
    }
  }
}

-- LSP servers to support with optional arguments
local servers = {
  pyright = {},
  tsserver = {},
  vuels = {},
  sumneko_lua = lua_settings
}

-- Configure each LSP by attaching completion and status capbilities
for server, config in pairs(servers) do
  config.capabilities = vim.tbl_deep_extend(
	  'keep', config.capabilities or {}, lsp_status.capabilities
	)
  lspconfig[server].setup(config)
end
