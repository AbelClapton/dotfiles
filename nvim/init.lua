-- TODO: refactor into own file
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system {
		'git',
		'clone',
		'--filter=blob:none',
		'https://github.com/folke/lazy.nvim.git',
		'--branch=stable', -- latest stable release
		lazypath,
	}
end
vim.opt.rtp:prepend(lazypath)
require 'art.options'
require 'art.keymaps'
require 'art.ui.diagnostics'
require 'art.globals'

local status_ok, lazy = pcall(require, 'lazy')
if not status_ok then return end

return lazy.setup('art.plugins', {
	defaults = {
		lazy = true,
	},
	install = {
		colorscheme = { 'nord' },
	},
	ui = {
		border = 'rounded',
	},
	git = {
		timeout = 1800, -- 30 mins
	},
})

-- TODO: Create 'plugin' to hide eol comments and show it on hover/key-press? Got time?
-- Can do this with conceal maybe

-- TODO: Migrate the cmp icons into the icons file

-- TODO: Do some syntax config to make italics skip unicode characters (icons babe 😉)

-- TODO: Create plugin for note/todo management

-- TODO: Check how to disable comments when inserting newline from commented line in normal mode

-- TODO: Lualine:
-- Include LSP data, such as servers attached
-- Try to make an 'Explorer Tab'

-- TODO: Which-key:
-- Add icons to keymaps, build up :)

-- TODO: Add the terminal plugin

-- TODO: Add function to populate data base on a pattern
-- Ex 1 2, 2 3, etc.

-- TODO: add command to capitalize selection, <cmd>s/\v<(.)(\w*)/\u\1\L\2/g<cr>
