local M = {}

--> Capabilities
local status_cmp_ok, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
if not status_cmp_ok then return end

M.capabilities = vim.lsp.protocol.make_client_capabilities()
M.capabilities.textDocument.completion.completionItem.snippetSupport = true
M.capabilities = cmp_nvim_lsp.default_capabilities(M.capabilities)

--> Keymaps
local function register_keymaps(bufnr)
	local opts = { noremap = true, silent = true }
	local keymap = vim.api.nvim_buf_set_keymap
	keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
	keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
	keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
	keymap(bufnr, 'n', 'gI', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
	keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
	keymap(bufnr, 'n', 'gl', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
end

local setupFormatting = function(bufnr)
	vim.lsp.buf.format {
		filter = function(client) return client.name == 'null-ls' end,
		bufnr = bufnr,
	}
end

function M.on_attach(client, bufnr)
	if client.supports_method 'textDocument/formatting' then
		vim.api.nvim_create_autocmd('BufWritePre', {
			group = vim.api.nvim_create_augroup('LspFormatting', {
				clear = true,
			}),
			buffer = bufnr,
			callback = function() setupFormatting(bufnr) end,
		})
	end

	register_keymaps(bufnr)

	local navic_ok, navic = pcall(require, 'nvim-navic') --> winbar
	if navic_ok and client.server_capabilities.documentSymbolProvider then navic.attach(client, bufnr) end

	local illuminate_ok, illuminate = pcall(require, 'illuminate') --> symbol highlight
	if illuminate_ok then illuminate.on_attach(client) end
end

return M
