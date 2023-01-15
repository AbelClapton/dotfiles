local null_ls_ok, null_ls = pcall(require, 'null-ls')
if not null_ls_ok then return end

local mason_null_ls_ok, mason_null_ls = pcall(require, 'mason-null-ls')
if not mason_null_ls_ok then return end

local formatting = null_ls.builtins.formatting
local code_actions = null_ls.builtins.code_actions
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup {
	border = 'rounded',
	sources = {
		formatting.prettierd,
		formatting.stylua,
		code_actions.eslint_d,
		diagnostics.eslint_d
	}
}

mason_null_ls.setup {
    ensure_installed = nil,
		automatic_installation = true,
		automatic_setup = false,
}
