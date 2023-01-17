return {
	'folke/which-key.nvim',
	config = function()
		require('which-key').setup()
		require('which-key').register {
			['<leader>'] = {
				w = { '<cmd>w!<CR>', 'Save' },
				q = { '<cmd>q!<CR>', 'Quit' },
				r = { '<cmd>runtime! lua/user/**/*.lua after/**/*.lua<CR>', 'reload' },
				c = { '<cmd>bdelete!<CR>', 'Close Buffer' },
				h = { '<cmd>nohlsearch<CR>', 'No Highlight' },
			},
			['<F2>'] = { '<cmd>Lazy<cr>', 'Lazy' },
		}
	end,
}
