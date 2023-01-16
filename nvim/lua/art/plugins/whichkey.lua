return {
	'folke/which-key.nvim',
	config = function(plugin)
		require('which-key').setup()
		require('which-key').register({
			w = { '<cmd>w!<CR>', 'Save' },
			q = { '<cmd>q!<CR>', 'Quit' },
			r = { '<cmd>runtime! lua/user/**/*.lua after/**/*.lua<CR>', 'reload' },
			c = { '<cmd>bdelete!<CR>', 'Close Buffer' },
			h = { '<cmd>nohlsearch<CR>', 'No Highlight' },
			L = { '<cmd>Lazy<cr>', 'Lazy' },
			}, { prefix = '<leader>' })
	end
}
