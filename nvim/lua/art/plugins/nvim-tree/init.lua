return {
	'nvim-tree/nvim-tree.lua',
	cmd = { 'NvimTreeToggle', 'NvimTreeClose' },
	keys = { { '<leader>e', '<cmd>NvimTreeToggle<cr>' } },
	config = require 'art.plugins.nvim-tree.config',
	dependencies = 'kyazdani42/nvim-web-devicons',
}
