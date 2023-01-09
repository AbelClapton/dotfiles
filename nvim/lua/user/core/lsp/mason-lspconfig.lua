local mason_lspconfig_ok, mason_lspconfig = pcall(require, 'mason-lspconfig')
if not mason_lspconfig_ok then return end

mason_lspconfig.setup {
	ensure_installed = {
		'sumneko_lua',
		'jsonls',
	},
	automatic_installation = false,
}

local lspconfig_ok, lspconfig = pcall(require, 'lspconfig')
if not lspconfig_ok then return end

mason_lspconfig.setup_handlers {
	function (server) -- default handler (optional)
		local opts = {
			on_attach = require('user.core.lsp.handlers').on_attach,
			capabilities = require('user.core.lsp.handlers').capabilities
		}

		local has_custom_opts, custom_opts = pcall(require, 'user.core.lsp.settings.' .. server)
		if has_custom_opts then
			opts = vim.tbl_deep_extend('force', custom_opts, opts)
		end

		lspconfig[server].setup(opts)
	end
}
