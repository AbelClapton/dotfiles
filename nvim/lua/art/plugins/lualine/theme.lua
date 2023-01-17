local colors = {
	nord0 = '#2E3440',
	nord1 = '#3B4252',
	nord2 = '#434C5E',
	nord3 = '#4C566A',
	nord4 = '#D8DEE9',
	nord5 = '#E5E9F0',
	nord6 = '#ECEFF4',
	nord7 = '#8FBCBB',
	nord8 = '#88C0D0',
	nord9 = '#81A1C1',
	nord10 = '#5E81AC',
	nord11 = '#BF616A',
	nord12 = '#D08770',
	nord13 = '#EBCB8B',
	nord14 = '#A3BE8C',
	nord15 = '#B48EAD',
	none = 'NONE',
}

return {
	normal = {
		a = { fg = colors.nord1, bg = colors.nord9 },
		b = { fg = colors.nord5, bg = colors.nord1 },
		c = { fg = colors.nord4, bg = colors.nord0 },
	},

	insert = {
		a = { fg = colors.nord1, bg = colors.nord4 },
		b = { fg = colors.nord6, bg = colors.nord2 },
		y = { fg = colors.nord5, bg = colors.nord2 },
	},

	visual = {
		a = { fg = colors.nord0, bg = colors.nord7 },
		b = { fg = colors.nord4, bg = colors.nord2 },
		y = { fg = colors.nord5, bg = colors.nord2 },
	},

	replace = {
		a = { fg = colors.nord0, bg = colors.nord11 },
		b = { fg = colors.nord4, bg = colors.nord2 },
		y = { fg = colors.nord5, bg = colors.nord2 },
	},

	command = {
		a = { fg = colors.nord0, bg = colors.nord15, gui = 'bold' },
		b = { fg = colors.nord4, bg = colors.nord2 },
		y = { fg = colors.nord5, bg = colors.nord2 },
	},

	inactive = {
		a = { fg = colors.nord4, bg = colors.nord1, gui = 'bold' },
		b = { fg = colors.nord4, bg = colors.nord1 },
		c = { fg = colors.nord4, bg = colors.nord0 },
	},
}
