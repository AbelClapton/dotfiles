local M = {}

M.mason = {
	ui = {
		check_outdated_packages_on_open = false,
		border = 'rounded',
		icons = {
			package_installed = '◍',
			package_pending = '◍',
			package_uninstalled = '◍',
		},
	},
	log_level = vim.log.levels.INFO,
	max_concurrent_installers = 4
}

M.mason_lspconfig = {
	ensure_installed = {
		'sumneko_lua',
		'jsonls',
	},
	automatic_installation = false,
}

M.setup_handlers = {
	function(server)
		local opts = {
			capabilities = require('art.plugins.lsp.handlers').capabilities,
			on_attach = require('art.plugins.lsp.handlers').on_attach
		}

		local has_custom_opts, custom_opts = pcall(require, 'art.plugins.lsp.servers.' .. server)
		if has_custom_opts then
			opts = require('art.utils.functions').tbl_join(custom_opts, opts)
		end

		require('lspconfig')[server].setup(opts)
	end
}

return M
