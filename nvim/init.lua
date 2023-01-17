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

local status_ok, lazy = pcall(require, 'lazy')
if not status_ok then return end

return lazy.setup('art.plugins', {
	ui = {
		border = 'single',
	},
	git = {
		timeout = 1800, -- 30 mins
	},
})

-- TODO: Create 'plugin' to hide eol comments and show it on hover/key-press? Got time?
-- Can do this with conceal maybe

-- TODO: Migrate the cmp icons into the icons file

-- TODO: Do some syntax config to make italics skip unicode characters (icons babe 😉)
