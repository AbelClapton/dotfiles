local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
		vim.cmd [[packadd packer.nvim]]
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

--> Autoload packer on plugins.lua write
vim.cmd([[
	augroup packer_user_config
		autocmd!
		autocmd BufWritePost plugins.lua source <afile> | PackerCompile
	augroup end
]])

--> Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, 'packer')
if not status_ok then return end

--> Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require('packer.util').float({ border = 'rounded' })
		end,
	},
})

return packer.startup(function(use)
	use 'wbthomason/packer.nvim'

	--> Common
	use { 'kyazdani42/nvim-web-devicons' }
	use { 'nvim-lua/plenary.nvim' }

	--> UI
	--> Colorscheme
	use { 'shaunsingh/nord.nvim' }

	--> Whichkey
	use { 'folke/which-key.nvim' }

	--> NvimTree
	use { 'kyazdani42/nvim-tree.lua', requires = 'kyazdani42/nvim-web-devicons' }

	--> Lualine
	use { 'nvim-lualine/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons', opt = true } }

	--> Bufferline
	use { 'akinsho/bufferline.nvim', tag = 'v3.*', requires = 'kyazdani42/nvim-web-devicons' }

	--> Syntax Highlighting
	use { 'nvim-treesitter/nvim-treesitter',  run = ':TSUpdate' }
	use { 'RRethy/vim-illuminate' }

	--> Core
	--> Telescope
	use { 'nvim-telescope/telescope.nvim', tag = '0.1.0', requires = 'nvim-lua/plenary.nvim' }

	--> Autopairs
	use { 'windwp/nvim-autopairs' }

	--> Autocompletion
	use { 'hrsh7th/nvim-cmp' }
	use { 'hrsh7th/cmp-buffer' }
	use { 'hrsh7th/cmp-path' }
	use { 'hrsh7th/cmp-nvim-lua' }
	use { 'hrsh7th/cmp-nvim-lsp' }
	use { 'hrsh7th/cmp-cmdline' }
	use { 'hrsh7th/cmp-calc' }
	use { 'hrsh7th/cmp-emoji' }
	use { 'ray-x/cmp-treesitter' }
	use { 'f3fora/cmp-spell' }

	--> Snippets
  use { 'L3MON4D3/LuaSnip', wants = 'rafamadriz/friendly-snippets' }
	use { 'rafamadriz/friendly-snippets' }
  use { 'saadparwaiz1/cmp_luasnip' }

	--> LSP
	use { 'williamboman/mason.nvim' }
	use { 'williamboman/mason-lspconfig.nvim' }
	use { 'neovim/nvim-lspconfig' }
	use { 'j-hui/fidget.nvim' } -- LSP Progress UI

	--> Utils
	--> Toggle Bool
	use { 'gerazov/vim-toggle-bool', requires = 'AndrewRadev/switch.vim' }

	--> Toggle Comments
	use { 'numToStr/Comment.nvim' }

	--> Todo Comments
	use { 'folke/todo-comments.nvim', requires = 'nvim-lua/plenary.nvim' }

	--> Better Folding
	use { 'anuvyklack/pretty-fold.nvim' }

	--> Extras
	use { 'folke/zen-mode.nvim', opt = true, cmd = 'ZenMode' }
	use { 'folke/twilight.nvim', opt = true, cmd = 'ZenMode' }

	--> Automatically set up your configuration after cloning packer.nvim
	--> Put this at the end after all plugins
	if packer_bootstrap then
		require('packer').sync()
	end
end)
