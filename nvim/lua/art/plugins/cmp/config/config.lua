local icons = require('art.ui.icons').kind
local cmp = require 'cmp'
local menu = {
	nvim_lsp = '[LSP]',
	nvim_lua = '[Lua]',
	buffer = '[Buffer]',
	luasnip = '[Snip]',
	treesitter = '[Treesitter]',
}

return {
	completion = {
		completeopt = 'menu,menuone,noinsert',
		keyword_length = 1,
	},
	experimental = {
		native_menu = false,
		ghost_text = true
	},
	enabled = function()
		if vim.api.nvim_get_mode().mode ~= 'c' then return end
		if require('cmp.config.context').in_treesitter_capture 'comment' then return end
		if require('cmp.config.context').in_syntax_group 'Comment' then return end
		return true
	end,
	formatting = {
		fields = { 'kind', 'abbr', 'menu' },
		format = function(entry, item)
			item.kind = string.format('%s', icons[item.kind])
			item.menu = menu[entry.source.name]
			return item
		end
	},
	mapping = {
		['<C-k>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 'c' }),
		['<C-j>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 'c' }),
		['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
		['<C-B>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
		['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
		['<C-e>'] = cmp.mapping { i = cmp.mapping.abort(), c = cmp.mapping.close() },
		['<C-f>'] = cmp.mapping(cmp.mapping.confirm { select = true }, { 'i', 'c' })
	},
	snippet = {
		expand = function(args) require('luasnip').lsp_expand(args.body) end,
	},
	sources = cmp.config.sources({
		{ name = 'nvim_lsp' },
		-- { name = 'nvim_lsp_signature_help' },
		-- { name = 'nvim_lsp_document_symbol' },
		{ name = 'nvim_lua' },
		{ name = 'luasnip' },
		{ name = 'treesitter' },
		{ name = 'path' },
		-- { name = 'emoji' },
		-- { name = 'spell' },
		-- { name = 'calc' },
		-- { name = 'plugins' },
	}, {
		{ name = 'buffer' },
	}),
	window = {
		documentation = cmp.config.window.bordered()
	}
}
