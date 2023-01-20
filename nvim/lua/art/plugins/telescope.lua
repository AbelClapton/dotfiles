return {
	'nvim-telescope/telescope.nvim',
	lazy = true,
	tag = '0.1.0',
	config = function()
		local status_ok, whichkey = pcall(require, 'which-key')
		if not status_ok then return end

		whichkey.register({
			name = 'Telescope  ',
			a = { '<cmd>Telescope autocommands<cr>', 'Find Autocmd' },
			b = { '<cmd>Telescope buffers<cr>', 'Find buffer' },
			c = { '<cmd>Telescope commands<cr>', 'Find Command' },
			C = { '<cmd>Telescope colorscheme<cr>', 'Find Colorscheme' }, -- HACK: does go here?
			f = { '<cmd>Telescope find_files<cr>', 'Find File' },
			h = { '<cmd>Telescope help_tags<cr>', 'Find Help' },
			k = { '<cmd>Telescope keymaps<cr>', 'Find Keymap' },
			p = { '<cmd>Telescope projects<cr>', ' Find Project' },
			r = { '<cmd>Telescope oldfiles<cr>', 'Recent Files' },
			s = { '<cmd>Telescope treesitter<cr>', 'Find Symbol' },
			t = { '<cmd>Telescope live_grep<cr>', 'Find Text' },
		}, { prefix = '<leader>f' })
	end,
	dependencies = 'nvim-lua/plenary.nvim',
}
