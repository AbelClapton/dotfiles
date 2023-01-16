local M = {}
local navic = require 'nvim-navic'
local icons = require 'art.ui.icons'
local f = require 'art.utils.functions'

local function get_filename()
	local filename = vim.fn.expand '%:t'
	local extension = vim.fn.expand '%:e'

	if not f.is_empty(filename) then
		local file_icon, file_icon_color =
			require('nvim-web-devicons').get_icon_color(filename, extension, { default = true })
		local hl_group = 'FileIconColor' .. extension
		vim.api.nvim_set_hl(0, hl_group, { fg = file_icon_color })

		if f.is_empty(file_icon) then file_icon = icons.kind.File end

		-- HACK: Hummm.... Helper function?
		-- for debug helper windows
		local filetype = vim.bo.filetype
		if filetype == 'dapui_breakpoints' then
			file_icon = icons.ui.Bug
		elseif filetype == 'dapui_stacks' then
			file_icon = icons.ui.Stacks
		elseif filetype == 'dapui_scopes' then
			file_icon = icons.ui.Stacks
		elseif filetype == 'dapui_watches' then
			file_icon = icons.ui.Stacks
		end

		local navic_text = vim.api.nvim_get_hl_by_name('Normal', true)
		vim.api.nvim_set_hl(0, 'Winbar', { fg = navic_text.foreground })

		return ' %#' .. hl_group .. '#' .. file_icon .. '%* %#Winbar#' .. filename .. '%*'
	end
end

local function get_location()
	if not navic.is_available() then return ' ' end
	local location = navic.get_location()
	if f.is_empty(location) or location == 'error' then return ' ' end

	return ' %#NavicSeparator#' .. icons.ui.ChevronRight .. '%* ' .. location
end

local function get_modified()
	if f.get_buf_option 'mod' then return ' %#LspCodeLens#' .. icons.ui.Circle .. '%*' end
	return ''
end

function M.get_winbar()
	local winbar = get_filename()
	if f.is_empty(winbar) then return end

	winbar = winbar .. get_location()
	winbar = winbar .. get_modified()

	local num_tabs = #vim.api.nvim_list_tabpages()
	if num_tabs > 1 then
		local tabpage_number = tostring(vim.api.nvim_tabpage_get_number(0))
		winbar = winbar .. ' %=' .. tabpage_number .. '/' .. tostring(num_tabs)
	end

	f.set_buf_option('winbar', winbar, { scope = 'local' })
end

return M
