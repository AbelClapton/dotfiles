return {
	'goolord/alpha-nvim',
	ft = 'alpha',
	dependencies = 'kyazdani42/nvim-web-devicons',
	config = function() require('alpha').setup(require('alpha.themes.startify').config) end,
}
