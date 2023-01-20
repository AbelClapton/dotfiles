return {
	'nvim-lualine/lualine.nvim',
	event = 'VeryLazy',
	config = function() require('lualine').setup(require 'art.plugins.lualine.config') end,
	dependencies = {
		'kyazdani42/nvim-web-devicons',
		'SmiteshP/nvim-navic',
	},
}
