local cmp_status_ok, cmp = pcall(require, 'cmp')
if not cmp_status_ok then return end

local luasnip_status_ok, luasnip = pcall(require, 'luasnip')
if not luasnip_status_ok then return end
require('luasnip/loaders/from_vscode').lazy_load()

local kind_icons = {
	Text = '',
	Method = 'm',
	Function = '',
	Constructor = '',
	Field = '',
	Variable = '',
	Class = '',
	Interface = '',
	Module = '',
	Property = '',
	Unit = '',
	Value = '',
	Enum = '',
	Keyword = '',
	Snippet = '',
	Color = '',
	File = '',
	Reference = '',
	Folder = '',
	EnumMember = '',
	Constant = '',
	Struct = '',
	Event = '',
	Operator = '',
	TypeParameter = '',
	-- find more here: https://www.nerdfonts.com/cheat-sheet
}

cmp.setup({
	completion = {
		completeopt = 'menu,menuone,noinsert',
		keyword_length = 1
	},

	experimental = {
		native_menu = false,
		ghost_text = true
	},

	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},

	formatting = {
		fields = { 'kind', 'abbr', 'menu' },
		format = function(entry, vim_item)
			-- Kind icons
			vim_item.kind = string.format('%s', kind_icons[vim_item.kind])
			vim_item.menu = ({
				nvim_lsp = '[LSP]',
				buffer = '[Buffer]',
				luasnip = '[Snip]',
				nvim_lua = '[Lua]',
				treesitter = '[Treesitter]',
			})[entry.source.name]
			return vim_item
		end,
	},

	enabled = function() -- disable completion in comments
		local context = require 'cmp.config.context'
		if vim.api.nvim_get_mode().mode == 'c' then
			return true
		else
			return not context.in_treesitter_capture("comment") and not context.in_syntax_group("Comment")
		end
	end,

	window = {
		-- completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},

	mapping = {
		['<C-k>'] = cmp.mapping.select_prev_item(),
		['<C-j>'] = cmp.mapping.select_next_item(),
		['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
		['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
		['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
		['<C-e>'] = cmp.mapping { i = cmp.mapping.abort(), c = cmp.mapping.close() },
		['<C-y>'] = cmp.mapping(cmp.mapping.confirm({ select = true }), { 'i', 'c' }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
	},

	sources = cmp.config.sources({
		{ name = 'nvim_lsp' },
		{ name = 'treesitter' },
		{ name = 'buffer' },
		{ name = 'luasnip' },
		{ name = 'nvim_lua' },
		{ name = 'path' },
		{ name = 'spell' },
		{ name = 'emoji' },
		{ name = 'calc' },
	}, {
		{ name = 'buffer' },
	})
})

cmp.setup.cmdline('/', {
	sources = {
		{ name = 'buffer' },
	},
})

cmp.setup.cmdline(':', {
	sources = cmp.config.sources({
		{ name = 'path' },
	}, {
		{ name = 'cmdline' },
	}),
})

local autopairs_status_ok, autopairs = pcall(require, 'nvim-autopairs.completion.cmp')
if not autopairs_status_ok then
	return
end
cmp.event:on('confirm_done', autopairs.on_confirm_done())
