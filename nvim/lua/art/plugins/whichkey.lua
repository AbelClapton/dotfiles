return {
	'folke/which-key.nvim',
	lazy = true,
	keys = { '<leader>' },
	config = function()
		require('which-key').setup()
		require('which-key').register {
			['<leader>'] = {
				w = { '<cmd>w!<CR>', 'Save' },
				q = { '<cmd>q!<CR>', 'Quit' },
				c = { '<cmd>bn|bd#<CR>', 'Close Buffer' },
				h = { '<cmd>nohlsearch<CR>', 'No Highlight' },
				t = { '<cmd>lua require("lazy.util").float_term()<CR>', 'Open Terminal' },
			},
			['<F2>'] = { '<cmd>Lazy<cr>', 'Lazy' },
		}
	end,
}
