local theme = require 'art.plugins.lualine.theme'
local navic = require 'nvim-navic'

return {
	options = {
		icons_enabled = true,
		theme = theme,
		section_separators = { left = '', right = ' ' },
		component_separators = { left = '', right = '' },
		disabled_filetypes = {
			statusline = {},
			winbar = { 'NvimTree' },
		},
		ignore_focus = { 'NvimTree' },
		always_divide_middle = true,
		globalstatus = true,
		refresh = {
			statusline = 100,
			tabline = 100,
			winbar = 100,
		},
	},
	sections = {
		lualine_a = { 'mode' },
		lualine_b = {
			{ 'hostname', icon = { '', align = 'left', color = { fg = 'teal' } } },
			'branch',
			'diff',
			'diagnostics',
		},
		lualine_c = { 'filename' },
		lualine_x = { 'encoding', 'fileformat', 'filetype' },
		lualine_y = { 'progress', 'searchcount' },
		lualine_z = { 'location' },
	},
	tabline = {
		lualine_a = {
			{
				'buffers',
				mode = 0,
				buffers_color = {
					active = { fg = '#2E3440', bg = '#81A1C1' },
					inactive = { fg = '#D8DEE9', bg = '#2E3440' },
				},
				symbols = {
					modified = '',
					alternate_file = '',
				},
			},
		},
		lualine_b = {},
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = {},
	},
	winbar = {
		lualine_a = { 'filename' },
		lualine_b = { 'location' },
		lualine_c = { { navic.get_location, cond = navic.is_available } },
		lualine_x = {},
		lualine_y = { 'diagnostics' },
		lualine_z = { '%n' },
	},
	inactive_winbar = {
		lualine_a = { 'filename' },
		lualine_b = {},
		lualine_c = {},
		lualine_x = {},
		lualine_y = { 'diagnostics' },
		lualine_z = { '%n' },
	},
	extensions = { 'nvim-tree', 'quickfix' },
}
