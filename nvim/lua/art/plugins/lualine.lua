return {
	'nvim-lualine/lualine.nvim',
	event = 'VeryLazy',
	config = function()
		local navic = require 'nvim-navic'

		require('lualine').setup {
			options = {
				icons_enabled = true,
				theme = 'auto',
				component_separators = { left = '', right = '' },
				section_separators = { left = '', right = '' },
				disabled_filetypes = {
					statusline = {},
					winbar = {},
				},
				ignore_focus = {},
				always_divide_middle = true,
				globalstatus = true,
				refresh = {
					statusline = 500,
					tabline = 500,
					winbar = 500,
				},
			},
			sections = {
				lualine_a = { 'mode' },
				lualine_b = { 'hostname', 'branch', 'diff', 'diagnostics' },
				lualine_c = { 'filename' },
				lualine_x = { 'encoding', 'fileformat', 'filetype' },
				lualine_y = { 'progress', 'searchcount' },
				lualine_z = { 'location' },
			},
			tabline = {
				lualine_a = { 'buffers' },
				lualine_b = {},
				lualine_c = {},
				lualine_x = {},
				lualine_y = {},
				lualine_z = {},
			},
			winbar = {
				lualine_a = { { navic.get_location, cond = navic.is_available } },
				lualine_b = {},
				lualine_c = {},
				lualine_x = {},
				lualine_y = {},
				lualine_z = {},
			},
			inactive_winbar = {
				lualine_a = { 'filename' },
				lualine_b = {},
				lualine_c = {},
				lualine_x = {},
				lualine_y = {},
				lualine_z = {},
			},
			extensions = {},
		}
	end,
	dependencies = {
		'kyazdani42/nvim-web-devicons',
		'shaunsingh/nord.nvim',
		'SmiteshP/nvim-navic',
	},
}
