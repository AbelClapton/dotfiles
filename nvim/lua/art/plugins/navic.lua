return {
	'SmiteshP/nvim-navic',
	lazy = true,
	config = {
		icons = require('art.ui.icons').kind,
		highlight = true,
		separator = ' ' .. require('art.ui.icons').ui.ChevronRight .. ' ',
		depth_limit = 5,
		depth_limit_indicator = '..',
	},
}
