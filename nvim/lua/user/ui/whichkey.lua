local status_ok, whichkey = pcall(require, 'which-key')
if not status_ok then
	return
end

local config = {
	plugins = {
		presets = {
			operators = true,
			motions = true,
		}
	},
	ignore_missing = false,
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
	b = { '<cmd>ToggleBool<CR>', 'Toggle boolean' },

	p = {
    name = 'Packer',
    c = { '<cmd>PackerCompile<CR>', 'Compile' },
    i = { '<cmd>PackerInstall<CR>', 'Install' },
    s = { '<cmd>PackerSync<CR>', 'Sync' },
    S = { '<cmd>PackerStatus<CR>', 'Status' },
    u = { '<cmd>PackerUpdate<CR>', 'Update' },
  },

	s = {
		name = "Search",
		b = { '<cmd>Telescope git_branches<CR>', 'Checkout branch' },
		c = { '<cmd>Telescope colorscheme<CR>', 'Colorscheme' },
		C = { '<cmd>Telescope commands<CR>', 'Commands' },
		f = { '<cmd>Telescope find_files<CR>', 'Find File' },
		h = { '<cmd>Telescope help_tags<CR>', 'Find Help' },
		H = { '<cmd>Telescope highlights<CR>', 'Find Highlight Groups' },
		k = { '<cmd>Telescope keymaps<CR>', 'Keymaps' },
		M = { '<cmd>Telescope man_pages<CR>', 'Man Pages' },
		p = {
			'<cmd>lua require("telescope.builtin").colorscheme({ enable_preview = true })<CR>',
			'Colorscheme Preview'
		},
		r = { '<cmd>Telescope oldfiles<CR>', 'Recent Files' },
		R = { '<cmd>Telescope registers<CR>', 'Registers' },
		t = { '<cmd>Telescope live_grep<CR>', 'Find Text' },
	},

	t = {
		name = 'Todos',
		n = { '<cmd>lua require("todo-comments").jump_next()<CR>', 'Next todo comment' },
		p = { '<cmd>lua require("todo-comments).jump_previous()<CR>', 'Previous todo comment' },
		s = { '<cmd>TodoTrouble<CR>', 'search' },
	},

	l = {
		name = 'Lsp',
		a = { '<cmd>lua vim.lsp.buf.code_action()<CR>', 'Code Action' },
		d = { '<cmd>Telescope diagnostics bufnr=0 theme=get_ivy<CR>', 'Buffer Diagnostics' },
		e = { '<cmd>Telescope quickfix<CR>', 'Telescope Quickfix' },
		f = { '<cmd>lua vim.lsp.buf.format{ async = true }<CR>', 'Format' },
		h = { '<cmd>lua vim.lsp.buf.signature_help()<CR>', 'Signature Help' },
		i = { '<cmd>LspInfo<CR>', 'LSP Info' },
		I = { '<cmd>Mason<CR>', 'Mason Info' },
		j = { '<cmd>lua vim.diagnostic.goto_next({buffer=0})<CR>', 'Next Diagnostic' },
		k = { '<cmd>lua vim.diagnostic.goto_prev({buffer=0})<CR>', 'Prev Diagnostic' },
		q = { '<cmd>lua vim.diagnostic.setloclist()<CR>', 'Quickfix' },
		r = { '<cmd>lua vim.lsp.buf.rename()<CR>', 'Rename' },
		s = { '<cmd>Telescope lsp_document_symbols<CR>', 'Document Symbols' },
		S = { '<cmd>Telescope lsp_dynamic_workspace_symbols<CR>', 'Workspace Symbols' },
		w = { '<cmd>Telescope diagnostics<CR>', 'Diagnostics' },
	},
}

whichkey.setup(config)
whichkey.register(mappings, opts)
