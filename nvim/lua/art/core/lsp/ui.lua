local icons = require('art.ui.icons').diagnostics

local signs = {
	{ name = 'DiagnosticSignError', text = icons.Error },
	{ name = 'DiagnosticSignWarn', text = icons.Warning },
	{ name = 'DiagnosticSignHint', text = icons.Hint },
	{ name = 'DiagnosticSignInfo', text = icons.Information },
}

local config = {
	virtual_text = true,
	signs = {
		active = signs,
	},
	update_in_insert = true,
	underline = true,
	severity_sort = true,
	float = {
		focusable = true,
		style = 'minimal',
		border = 'rounded',
		source = 'always',
		header = '',
		prefix = '',
		format = function(d)
			local code = d.code or (d.user_data and d.user_data.lsp.code)
			if code then return string.format(' %s [%s] ', d.message, code):gsub('%.', '') end
			return d.message
		end,
	},
}

for _, sign in ipairs(signs) do
	vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = '' })
end
vim.diagnostic.config(config)
vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, {
	border = 'rounded',
})
vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, {
	border = 'rounded',
})
