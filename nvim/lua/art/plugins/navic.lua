return {
	'SmiteshP/nvim-navic',
	config = {
		icons = require('art.ui.icons').kind,
		highlight = true,
		separator = ' ' .. require('art.ui.icons').ui.ChevronRight .. ' ',
		depth_limit = 0,
		depth_limit_indicator = '..',
	},
	dependencies = 'neovim/nvim-lspconfig',
}
