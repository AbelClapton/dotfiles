return {
	'folke/drop.nvim',
	event = 'VimEnter',
	enabled = false,
	config = {
		theme = 'leaves',
		max = 40,
		interval = 50,
		screensaver = 1000 * 60 * 1,
		filetypes = { 'dashboard', 'alpha', 'starter', 'lua' }, -- will enable/disable automatically for the following filetypes
	},
}
