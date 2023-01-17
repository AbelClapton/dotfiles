return {
	'nvim-lualine/lualine.nvim',
	event = 'VeryLazy',
	-- config = require 'art.plugins.lualine.config',
	config = function()
		local status_ok, navic = pcall(require, 'nvim-navic')
		if status_ok then print 'loaded' end

		require('lualine').setup(require 'art.plugins.lualine.config')
	end,
	dependencies = {
		'kyazdani42/nvim-web-devicons',
	},
}
