local language = require("user.plugins.lsp.language")

return {
	-- lspconfig
	{
		"neovim/nvim-lspconfig",
		event = "BufReadPre",
		dependencies = {
			{ "folke/neoconf.nvim", cmd = "Neoconf", config = true },
			{ "folke/neodev.nvim", opts = { experimental = { pathStrict = true } } },
			"mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			{
				"hrsh7th/cmp-nvim-lsp",
				cond = function()
					return require("user.core.util").has("nvim-cmp")
				end,
			},
		},
		keys = {
			{ "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", desc = "Go to definition" },
			{ "gr", "<cmd>lua vim.lsp.buf.references()<cr>", desc = "Get references" },
			{ "K", "<cmd>lua vim.lsp.buf.hover()<cr>", desc = "Check signature help" },
			{ "<c-k>", "<cmd>lua vim.lsp.buf.signature_help()<cr>", desc = "Check signature help", mode = "i" },
			{ "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<cr>", desc = "Rename symbol" },
			{ "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<cr>", desc = "Rename symbol" },
			{ "<leader>k", "<cmd>lua vim.diagnostic.goto_prev()<cr>", desc = "Go to prev diagnostic issue" },
			{ "<leader>j", "<cmd>lua vim.diagnostic.goto_next()<cr>", desc = "Go to next diagnostic issue" },
			{ "<leader>l", "<cmd>lua vim.diagnostic.open_float()<cr>", desc = "Get diagnostic issue under cursor" },
			{ "<F6>", "<cmd>LspRestart<cr>", desc = "Restart LSP server" },
		},
		opts = {
			-- options for vim.diagnostic.config()
			diagnostics = {
				underline = false,
				update_in_insert = false,
				virtual_text = false,
				severity_sort = true,
			},
			-- Automatically format on save
			autoformat = true,
			-- options for vim.lsp.buf.format
			-- `bufnr` and `filter` is handled by the LazyVim formatter,
			-- but can be also overriden when specified
			format = {
				formatting_options = nil,
				timeout_ms = nil,
			},
			-- LSP Server Settings
			servers = {
				cssls = {},
				gopls = {},
				html = {},
				pyright = language.python,
				sumneko_lua = language.sumneko,
				tsserver = {},
				tailwindcss = {},
			},
			-- you can do any additional lsp server setup here
			-- return true if you don't want this server to be setup with lspconfig
			setup = {
				-- example to setup with typescript.nvim
				-- tsserver = function(_, opts)
				--   require("typescript").setup({ server = opts })
				--   return true
				-- end,
				-- Specify * to use this function as a fallback for any server
				-- ["*"] = function(server, opts) end,
			},
		},
		config = function(plugin, opts)
			-- setup autoformat
			require("user.plugins.lsp.format").autoformat = opts.autoformat
			-- setup formatting
			require("user.core.util").on_attach(function(client, buffer)
				require("user.plugins.lsp.format").on_attach(client, buffer)
			end)

			-- diagnostics
			for name, icon in pairs(require("user.core.config").icons.diagnostics) do
				name = "DiagnosticSign" .. name
				vim.fn.sign_define(name, { text = icon, texthl = name, numhl = "" })
			end
			vim.diagnostic.config(opts.diagnostics)

			local servers = opts.servers
			local capabilities =
				require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

			local function setup(server)
				local server_opts = servers[server] or {}
				server_opts.capabilities = capabilities
				if opts.setup[server] then
					if opts.setup[server](server, server_opts) then
						return
					end
				elseif opts.setup["*"] then
					if opts.setup["*"](server, server_opts) then
						return
					end
				end
				require("lspconfig")[server].setup(server_opts)
			end

			local mlsp = require("mason-lspconfig")
			local available = mlsp.get_available_servers()

			local ensure_installed = {}
			for server, server_opts in pairs(servers) do
				if server_opts then
					server_opts = server_opts == true and {} or server_opts
					-- run manual setup if mason=false or if this is a server that cannot be installed with mason-lspconfig
					if server_opts.mason == false or not vim.tbl_contains(available, server) then
						setup(server)
					else
						ensure_installed[#ensure_installed + 1] = server
					end
				end
			end

			require("mason-lspconfig").setup({ ensure_installed = ensure_installed })
			require("mason-lspconfig").setup_handlers({ setup })
		end,
	},

	-- formatters
	{
		"jose-elias-alvarez/null-ls.nvim",
		event = "BufReadPre",
		dependencies = { "mason.nvim" },
		opts = function()
			local nls = require("null-ls")
			return {
				sources = {
					-- python
					nls.builtins.formatting.black,
					nls.builtins.formatting.isort,
					-- golang
					nls.builtins.formatting.gofumpt,
					nls.builtins.formatting.goimports,
					-- lua
					nls.builtins.formatting.stylua,
					-- general
					nls.builtins.formatting.prettier,
				},
			}
		end,
	},

	-- cmdline tools and lsp servers
	{

		"williamboman/mason.nvim",
		cmd = "Mason",
		keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
		opts = {
			ensure_installed = {
				"css-lsp",
				"gopls",
				"html-lsp",
				"pyright",
				"lua-language-server",
				"tailwindcss-language-server",
				"typescript-language-server",
				"debugpy",
				"delve",
				"black",
				"isort",
				"gofumpt",
				"goimports",
				"prettier",
				"stylua",
			},
		},
		---@param opts MasonSettings | {ensure_installed: string[]}
		config = function(plugin, opts)
			require("mason").setup(opts)
			local mr = require("mason-registry")
			for _, tool in ipairs(opts.ensure_installed) do
				local p = mr.get_package(tool)
				if not p:is_installed() then
					p:install()
				end
			end
		end,
	},
}
