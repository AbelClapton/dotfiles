local icons = require 'art.ui.icons'
local f = require 'art.plugins.nvim-tree.functions'

return {
	actions = {
		change_dir = {
			enable = true,
			global = false,
			restrict_above_cwd = false,
		},
		open_file = {
			quit_on_open = false,
			resize_window = false,
			window_picker = {
				enable = true,
				buftype = { 'nofile', 'terminal', 'help' },
				filetype = { 'notify', 'packer', 'qf', 'diff', 'fugitive', 'fugitiveblame' },
			},
		},
		use_system_clipboard = true,
	},
	auto_reload_on_write = false,
	diagnostics = {
		enable = true,
		show_on_dirs = true,
		icons = {
			hint = icons.diagnostics.BoldHint,
			info = icons.diagnostics.BoldInformation,
			warning = icons.diagnostics.BoldWarning,
			error = icons.diagnostics.BoldError,
		},
	},
	filters = {
		dotfiles = false,
		custom = { 'node_modules', '\\.cache' },
		exclude = {},
	},
	git = {
		enable = true,
		ignore = false,
		timeout = 200,
	},
	hijack_directories = {
		enable = true,
	},
	live_filter = {
		prefix = '[FILTER]: ',
		always_show_folders = false, -- Turn into false from true by default
	},
	renderer = {
		icons = {
			show = {
				git = false,
				folder = true,
				file = true,
				folder_arrow = true,
			},
			glyphs = {
				default = icons.ui.Text,
				symlink = icons.ui.FileSymlink,
				git = {
					deleted = icons.git.FileDeleted,
					ignored = icons.git.FileIgnored,
					renamed = icons.git.FileRenamed,
					staged = icons.git.FileStaged,
					unstaged = icons.git.FileUnstaged,
					unmerged = icons.git.FileUnmerged,
					untracked = icons.git.FileUntracked,
				},
				folder = {
					default = icons.ui.Folder,
					open = icons.ui.FolderOpen,
					empty = icons.ui.EmptyFolder,
					empty_open = icons.ui.EmptyFolderOpen,
					symlink = icons.ui.FolderSymlink,
				},
			},
		},
		highlight_git = true,
		group_empty = false,
		root_folder_modifier = ':t',
	},
	respect_buf_cwd = true,
	sync_root_with_cwd = true,
	system_open = {
		cmd = nil,
		args = {},
	},
	trash = {
		cmd = 'trash',
	},
	update_cwd = true,
	update_focused_file = {
		enable = true,
		update_cwd = true,
		-- update_root = true,
	},
	view = {
		width = 30,
		hide_root_folder = false,
		side = 'left',
		number = false,
		relativenumber = false,
		signcolumn = 'yes',
		preserve_window_proportions = true,
		mappings = {
			custom_only = false,
			list = {
				{ key = 'l', action = 'edit', action_cb = f.edit_or_open },
				{
					key = 'L',
					action = 'vsplit_preview',
					action_cb = f.vsplit_preview,
				},
				{ key = 'h', action = 'close_node' },
				{ key = 'H', action = 'collapse_all', action_cb = f.collapse_all },
				{ key = 'ga', action = 'git_add', action_cb = f.git_add },
			},
		},
	},
}
