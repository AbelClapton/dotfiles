return {
	'hrsh7th/nvim-cmp',
	event = 'InsertEnter',
	config = function()
		local cmp = require 'cmp'

		cmp.setup { -- default
			completion = {
				completeopt = 'menu,menuone,noselect',
				keyword_length = 1,
			},
			experimental = {
				native_menu = false,
				ghost_text = true,
			},
			formatting = {
				fields = { 'kind', 'abbr', 'menu' },
				format = function(entry, item)
					item.kind = string.format('%s %s', require('art.ui.icons').kind[item.kind], item.kind)
					item.menu = ({
						nvim_lsp = '[LSP]',
						nvim_lua = '[Lua]',
						buffer = '[Buffer]',
						luasnip = '[Snip]',
						treesitter = '[Treesitter]',
					})[entry.source.name]
					return item
				end,
			},
			mapping = {
				['<C-k>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 'c' }),
				['<C-j>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 'c' }),
				['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
				['<C-B>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
				['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
				['<C-e>'] = cmp.mapping { i = cmp.mapping.abort(), c = cmp.mapping.close() },
				['<C-f>'] = cmp.mapping(cmp.mapping.confirm { select = true }, { 'i', 'c' }),
			},
			snippet = {
				expand = function(args) require('luasnip').lsp_expand(args.body) end,
			},
			view = {
				entries = { name = 'custom', selection_orden = 'near_cursor' },
			},
			window = {
				documentation = cmp.config.window.bordered(),
			},
			sources = cmp.config.sources({
				{ name = 'nvim_lsp', trigger_characters = { '.' } },
				{ name = 'nvim_lua' },
				{ name = 'luasnip' },
				{ name = 'path' },
			}, {
				{ name = 'treesitter' },
				{ name = 'buffer' },
			}),
		}
		cmp.event:on('confirm_done', require('nvim-autopairs.completion.cmp').on_confirm_done())
	end,
	dependencies = {
		'hrsh7th/cmp-nvim-lsp',
		'hrsh7th/cmp-nvim-lua',
		'hrsh7th/cmp-path',
		'hrsh7th/cmp-buffer',
		'saadparwaiz1/cmp_luasnip',
		'ray-x/cmp-treesitter',
		{ 'L3MON4D3/LuaSnip', config = true },
	},
}
