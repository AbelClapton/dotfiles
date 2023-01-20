local M = {}

local function get_capabilities()
	local status_ok, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
	if status_ok then return cmp_nvim_lsp.default_capabilities() end

	local capabilities = vim.lsp.protocol.make_client_capabilities()
	capabilities.textDocument.completion.completionItem.snippetSupport = true
	capabilities.textDocument.completion.completionItem.resolveSupport = {
		properties = {
			'documentation',
			'detail',
			'additionalTextEdits',
		},
	}
	return capabilities
end

local function setup_formatting(client, bufnr)
	if client.supports_method 'textDocument/formatting' then
		vim.api.nvim_create_autocmd('BufWritePre', {
			group = vim.api.nvim_create_augroup('LspFormatting', { clear = true }),
			buffer = bufnr,
			callback = function()
				vim.lsp.buf.format {
					filter = function(c) return c.name == 'null-ls' end,
					bufnr = bufnr,
				}
			end,
		})
	end
end

local function register_keymaps(bufnr)
	require('which-key').register({
		K = { '<cmd>lua vim.lsp.buf.hover()<CR>', 'Hover' },
		g = {
			D = { '<cmd>lua vim.lsp.buf.declaration()<CR>', 'Goto Declaration' },
			d = { '<cmd>lua vim.lsp.buf.definition()<CR>', 'Goto Definition' },
			I = { '<cmd>lua vim.lsp.buf.implementation()<CR>', 'Goto Implementation' },
			r = { '<cmd>lua vim.lsp.buf.references()<CR>', 'Goto References' },
			l = { '<cmd>lua vim.diagnostic.open_float()<CR>', 'Open Diagnostics' },
		},
		['<leader>l'] = {
			f = { '<cmd>lua vim.lsp.buf.format()<cr>', 'Format Document' },
			j = { '<cmd>lua vim.diagnostic.goto_next()<cr>', 'Goto next diagnostic' },
			k = { '<cmd>lua vim.diagnostic.goto_prev()<cr>', 'Goto prev diagnostic' },
		},
	}, { buffer = bufnr })
end

M.capabilities = get_capabilities()
M.on_attach = function(client, bufnr)
	register_keymaps(bufnr)
	setup_formatting(client, bufnr)

	local navic_ok, navic = pcall(require, 'nvim-navic')
	if navic_ok and client.server_capabilities.documentSymbolProvider then navic.attach(client, bufnr) end

	local illuminate_ok, illuminate = pcall(require, 'illuminate')
	if illuminate_ok then illuminate.on_attach(client) end
end

return M
