local M = {}

function M.keymap()
	if vim.opt.iminsert:get() > 0 and vim.b.keymap_name then return '⌨ ' .. vim.b.keymap_name end
	return ''
end

return M
