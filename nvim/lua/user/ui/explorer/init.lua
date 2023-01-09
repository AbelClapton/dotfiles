local status_ok, nvim_tree = pcall(require, 'nvim-tree')
if not status_ok then return end

--> Disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
local HEIGHT_RATIO = 0.8
local WIDTH_RATIO = 0.5

require 'user.ui.explorer.functions'

local config = {
	live_filter = {
		prefix = "[FILTER]: ",
		always_show_folders = false, -- Turn into false from true by default
	},
	view = {
		float = {
			enable = true,
			open_win_config = function()
				local screen_w = vim.opt.columns:get()
				local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
				local window_w = screen_w * WIDTH_RATIO
				local window_h = screen_h * HEIGHT_RATIO
				local window_w_int = math.floor(window_w)
				local window_h_int = math.floor(window_h)
				local center_x = (screen_w - window_w) / 2
				local center_y = ((vim.opt.lines:get() - window_h) / 2) - vim.opt.cmdheight:get()
				return {
					border = 'rounded',
					relative = 'editor',
					row = center_y,
					col = center_x,
					width = window_w_int,
					height = window_h_int,
				}
			end,
		},
		width = function()
			return math.floor(vim.opt.columns:get() * WIDTH_RATIO)
		end,
		mappings = {
			custom_only = false,
			list = {
				{ key = "l", action = "edit", action_cb = edit_or_open },
				{ key = "L", action = "vsplit_preview", action_cb = vsplit_preview },
				{ key = "h", action = "close_node" },
				{ key = "H", action = "collapse_all", action_cb = collapse_all }
			}
		},
	},
	renderer = {
		icons = {
			show = {
				folder_arrow = false,
			},
		},
	},
	actions = {
		open_file = {
			quit_on_open = false
		}
	}
} 

nvim_tree.setup(config)
