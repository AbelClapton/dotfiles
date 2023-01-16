return {
	'nvim-treesitter/nvim-treesitter',
	event = 'VimEnter',
	config = function()
		require('nvim-treesitter.configs').setup {
			ensure_installed = {},
			sync_install = false,
			auto_install = true,
			ignore_install = { 'jsonc', 'blueprint', 'fusion' },
			highlight = {
				enable = true,
				disable = {},
			},
			indent = {
				enable = true,
			}
		}
	end,
	build = ':TSUpdate'
}
