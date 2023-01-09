local status_ok, whichkey = pcall(require, 'which-key')
if not status_ok then
	return
end

local config = {
	plugins = {
		presets = {
			operators = false,
			motions = false,
		}
	}
}

local opts = {
	mode = 'n', --> NORMAL mode
	prefix = '<leader>',
	buffer = nil, --> Global mappings. Specify a buffer number for buffer local mappings
	silent = true, --> use `silent` when creating keymaps
	noremap = true, --> use `noremap` when creating keymaps
	nowait = true, --> use `nowait` when creating keymaps
}

local mappings = {
	e = { '<cmd>NvimTreeToggle<CR>', 'Explorer' },
	w = { '<cmd>w!<CR>', 'Save' },
	q = { '<cmd>q!<CR>', 'Quit' },
	r = { '<cmd>runtime! lua/user/**/*.lua after/**/*.lua<CR>', 'reload' },
	c = { '<cmd>bdelete!<CR>', 'Close Buffer' },
  h = { '<cmd>nohlsearch<CR>', 'No Highlight' },
	T = { '<cmd>ToggleBool<CR>', 'Toggle boolean' },

	p = {
    name = 'Packer',
    c = { '<cmd>PackerCompile<CR>', 'Compile' },
    i = { '<cmd>PackerInstall<CR>', 'Install' },
    s = { '<cmd>PackerSync<CR>', 'Sync' },
    S = { '<cmd>PackerStatus<CR>', 'Status' },
    u = { '<cmd>PackerUpdate<CR>', 'Update' },
  },

	f = {
		name = "Search",
		h = { '<cmd>lua require("telescope.builtin").help_tags()<cr>', 'Help' },
		f = { '<cmd>lua require("telescope.builtin").find_files()<CR>', 'Files' },
		b = { '<cmd>lua require("telescope.builtin").buffers()<CR>', 'Buffers' },
		g = { '<cmd>lua require("telescope.builtin").live_grep()<CR>', 'Text' },
	},

	t = {
		name = 'Todos',
		n = { '<cmd>lua require("todo-comments").jump_next()<CR>', 'Next todo comment' },
		p = { '<cmd>lua require("todo-comments).jump_previous()<CR>', 'Previous todo comment' },
		s = { '<cmd>TodoTrouble<CR>', 'search' },
	}
}

whichkey.setup(config)
whichkey.register(mappings, opts)
