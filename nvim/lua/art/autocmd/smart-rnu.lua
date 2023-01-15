--> Enable relative numbers when entering Visual, Visual Block and Operator-Pending Mode
local group = vim.api.nvim_create_augroup('SmartRelativeNumbers', {
	clear = true
})

vim.api.nvim_create_autocmd('ModeChanged', {
	pattern = '*',
	group = group,
	callback = function()
		vim.wo.relativenumber = vim.v.event.new_mode:match('^[in]') == nil
	end,
})
