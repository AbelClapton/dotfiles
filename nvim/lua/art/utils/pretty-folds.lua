local status_ok, pretty_fold = pcall(require, 'pretty-fold')
if not status_ok then return end

pretty_fold.setup {
	sections = {
		left = {
			'content',
		},
		right = {
			' ', 'number_of_folded_lines', ': ', 'percentage', ' ',
			function(config) return config.fill_char:rep(3) end
		}
	},
	fill_char = ' ',
	remove_fold_markers = true,
	keep_indentation = true,
	add_close_pattern = true, -- true, 'last_line' or false

	-- Possible values:
	-- "delete" : Delete all comment signs from the fold string.
	-- "spaces" : Replace all comment signs with equal number of spaces.
	-- false    : Do nothing with comment signs.
	process_comment_signs = false,

	-- Comment signs additional to the value of `&commentstring` option.
	comment_signs = {},

	-- List of patterns that will be removed from content foldtext section.
	stop_words = {
		'@brief%s*', -- (for C++) Remove '@brief' and all spaces after.
	},

	matchup_patterns = {
		{  '{', '}' },
		{ '%(', ')' }, -- % to escape lua pattern char
		{ '%[', ']' }, -- % to escape lua pattern char
	},

	ft_ignore = { 'neorg' },
}

pretty_fold.ft_setup('lua', {
	fill_char = ' ',
	add_close_pattern = true,
	process_comment_signs = false,
	matchup_patterns = {
		{ '^%s*do$', 'end' }, -- do ... end blocks
		{ '^%s*if', 'end' },  -- if ... end
		{ '^%s*for', 'end' }, -- for
		{ 'function%s*%(', 'end' }, -- 'function( or 'function (''
		{  '{', '}' },
		{ '%(', ')' }, -- % to escape lua pattern char
		{ '%[', ']' }, -- % to escape lua pattern char
	},
})

vim.api.nvim_create_autocmd('BufEnter', {
	pattern = '*',
	command = 'normal! zR',
	group = vim.api.nvim_create_augroup('RevealFold', {
		clear = true
	})
})
