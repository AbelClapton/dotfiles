local M = {}
-- local function get_capabilities()
-- 	local capabilities = vim.lsp.protocol.make_client_capabilities()
-- 	capabilities.textDocument.completion.completionItem.snippetSupport = true
-- 	return require('cmp_nvim_lsp').default_capabilities(capabilities)
-- end
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
	}, { buffer = bufnr })
end
M.capabilities = require('cmp_nvim_lsp').default_capabilities()
M.on_attach = function(client, bufnr)
	register_keymaps(bufnr)
	setup_formatting(client, bufnr)

	if client.server_capabilities.documentSymbolProvider then require('nvim-navic').attach(client, bufnr) end

	require('illuminate').on_attach(client)
end

return M
