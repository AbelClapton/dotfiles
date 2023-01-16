local icons = require 'art.ui.icons'

return {
	hijack_directories = {
		enable = true,
	},
	live_filter = {
		prefix = '[FILTER]: ',
		always_show_folders = false, -- Turn into false from true by default
	},
	diagnostics = {
		icons = {
			hint = icons.diagnostics.BoldHint,
			info = icons.diagnostics.BoldInformation,
			warning = icons.diagnostics.BoldWarning,
			error = icons.diagnostics.BoldError,
		},
	},
	view = {
		width = 30,
		hide_root_folder = false,
		side = 'left',
		number = false,
		relativenumber = false,
		signcolumn = 'yes',
		mappings = {
			custom_only = false,
			list = {
				{ key = 'l', action = 'edit', action_cb = edit_or_open },
				{
					key = 'L',
					action = 'vsplit_preview',
					action_cb = vsplit_preview,
				},
				{ key = 'h', action = 'close_node' },
				{ key = 'H', action = 'collapse_all', action_cb = collapse_all },
				{ key = 'ga', action = 'git_add', action_cb = git_add },
			},
		},
	},
	renderer = {
		icons = {
			show = {
				git = false,
				folder = true,
				file = true,
				folder_arrow = false,
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
	actions = {
		open_file = {
			quit_on_open = false,
		},
	},
	sync_root_with_cwd = true,
	respect_buf_cwd,
	update_focused_file = {
		enable = true,
		update_root = true,
	},
	filters = {
		dotfiles = false,
		custom = { 'node_modules', '\\.cache' },
		exclude = {},
	},
}
