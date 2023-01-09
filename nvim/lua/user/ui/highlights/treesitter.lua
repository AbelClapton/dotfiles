local status_ok, configs = pcall(require, 'nvim-treesitter.configs')
if not status_ok then
	return
end

configs.setup {
	require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = 'all',

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = false,

  -- List of parsers to ignore installing (for "all")
  ignore_install = { 'jsonc', 'blueprint', 'fusion' },

  ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
  -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be disabled
    disable = {},
  },
}}

vim.api.nvim_create_autocmd(
	{ 'BufAdd', 'BufEnter', 'BufNew', 'BufNewFile', 'BufWinEnter' },
	{
		pattern = '*',
		callback = function()
			vim.opt.foldmethod = 'expr'
			vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
		end,
		group = vim.api.nvim_create_augroup('FoldConfig', {
			clear = true
		})
	}
)
