return {
	'nvim-telescope/telescope.nvim',
	tag = '0.1.0',
	config = function()
		local status_ok, whichkey = pcall(require, 'which-key')
		if not status_ok then return end

		whichkey.register({
			name = 'Telescope  ',
			r = { '<cmd>Telescope oldfiles<cr>', 'Recent Files' },
			f = { '<cmd>Telescope find_files<cr>', 'Find File' },
			p = { '<cmd>Telescope projects<cr>', ' Find Project' },
			s = { '<cmd>Telescope treesitter<cr>', 'Find Symbol' },
			k = { '<cmd>Telescope keymaps<cr>', 'Find Keymap' },
			h = { '<cmd>Telescope help_tags<cr>', 'Find Help' },
			t = { '<cmd>Telescope live_grep<cr>', 'Find Text' },
			c = { '<cmd>Telescope commands<cr>', 'Find Command' },
			a = { '<cmd>Telescope autocommands<cr>', 'Find Autocmd' },
			C = { '<cmd>Telescope colorscheme<cr>', 'Find Colorscheme' }, -- HACK: does go here?
		}, { prefix = '<leader>f' })
	end,
	dependencies = 'nvim-lua/plenary.nvim',
}
