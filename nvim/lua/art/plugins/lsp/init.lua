return {
	'neovim/nvim-lspconfig',
	event = 'BufReadPre',
	config = function()
		local config = require 'art.plugins.lsp.config'
		require('mason').setup(config.mason)
		require('mason-lspconfig').setup(config.mason_lspconfig)
		require('mason-lspconfig').setup_handlers(config.setup_handlers)
	end,
	dependencies = {
		'williamboman/mason-lspconfig.nvim',
		'williamboman/mason.nvim',
		-- 'hrsh7th/cmp-nvim-lsp'
	},
}
