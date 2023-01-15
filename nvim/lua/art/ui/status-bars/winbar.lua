local status_ok, navic = pcall(require, 'nvim-navic')
if not status_ok then return end

local icons = require 'art.ui.icons'
local f = require 'art.utils.functions'

local exclude = {
	'help',
	'startify',
	'dashboard',
	'packer',
	'neo-tree',
	'neogitstatus',
	'NvimTree',
	'NvimTree_1',
	'Trouble',
	'alpha',
	'lir',
	'Outline',
	'spectre_panel',
	'toggleterm',
	'DressingSelect',
	'Jaq',
	'harpoon',
	'dap-repl',
	'dap-terminal',
	'dapui_console',
	'lab',
	'Markdown',
	'notify',
	'noice',
	'',
}
local config = {
	icons = {
		Array = icons.kind.Array .. ' ',
		Boolean = icons.kind.Boolean,
		Class = icons.kind.Class .. ' ',
		Color = icons.kind.Color .. ' ',
		Constant = icons.kind.Constant .. ' ',
		Constructor = icons.kind.Constructor .. ' ',
		Enum = icons.kind.Enum .. ' ',
		EnumMember = icons.kind.EnumMember .. ' ',
		Event = icons.kind.Event .. ' ',
		Field = icons.kind.Field .. ' ',
		File = icons.kind.File .. ' ',
		Folder = icons.kind.Folder .. ' ',
		Function = icons.kind.Function .. ' ',
		Interface = icons.kind.Interface .. ' ',
		Key = icons.kind.Key .. ' ',
		Keyword = icons.kind.Keyword .. ' ',
		Method = icons.kind.Method .. ' ',
		Module = icons.kind.Module .. ' ',
		Namespace = icons.kind.Namespace .. ' ',
		Null = icons.kind.Null .. ' ',
		Number = icons.kind.Number .. ' ',
		Object = icons.kind.Object .. ' ',
		Operator = icons.kind.Operator .. ' ',
		Package = icons.kind.Package .. ' ',
		Property = icons.kind.Property .. ' ',
		Reference = icons.kind.Reference .. ' ',
		Snippet = icons.kind.Snippet .. ' ',
		String = icons.kind.String .. ' ',
		Struct = icons.kind.Struct .. ' ',
		Text = icons.kind.Text .. ' ',
		TypeParameter = icons.kind.TypeParameter .. ' ',
		Unit = icons.kind.Unit .. ' ',
		Value = icons.kind.Value .. ' ',
		Variable = icons.kind.Variable .. ' ',
	},
	highlight = true,
	separator = ' ' .. icons.ui.ChevronRight .. ' ',
	depth_limit = 0,
	depth_limit_indicator = '..',
}

local function is_excluded() return vim.tbl_contains(exclude or {}, vim.bo.filetype) end

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
	if not navic.is_available() then return '' end
	local location = navic.get_location()
	if f.is_empty(location) or location == 'error' then return '' end

	return '%#NavicSeparator#' .. icons.ui.ChevronRight .. '%* ' .. location
end

-- sets winbar to get_filename() + get_location()
local function get_winbar()
	local winbar = get_filename()
	if f.is_empty(winbar) then return end

	local location_added = false
	local location = get_location()
	if not f.is_empty(location) then
		winbar = string.format('%s %s', winbar, location)
		location_added = true
	end

	if f.get_buf_option 'mod' then
		local mod = '%#LspCodeLens#' .. icons.ui.Circle .. '%*'
		if location_added then winbar = winbar .. ' ' end
		winbar = winbar .. mod
	end

	local num_tabs = #vim.api.nvim_list_tabpages()
	if num_tabs > 1 then
		local tabpage_number = tostring(vim.api.nvim_tabpage_get_number(0))
		winbar = winbar .. '%=' .. tabpage_number .. '/' .. tostring(num_tabs)
	end

	f.set_buf_option('winbar', winbar, { scope = 'local' })
end

local function create_winbar()
	if vim.fn.has 'nvim-0.8' ~= 1 then return end
	if is_excluded() then return end

	vim.api.nvim_create_autocmd(
		{ 'CursorHoldI', 'CursorHold', 'BufWinEnter', 'BufFilePost', 'InsertEnter', 'BufWritePost', 'TabClosed' },
		{
			group = vim.api.nvim_create_augroup('_winbar', {}),
			callback = function()
				if not f.buf_get_var(0, 'lsp_floating_window') then get_winbar() end
			end,
		}
	)
end

create_winbar()
navic.setup(config)
