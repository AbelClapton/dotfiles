-- Functional wrapper for mapping custom keybindings
local function map(mode, lhs, rhs, opts)
	local options = { noremap = true, silent = true }
	if opts then options = vim.tbl_extend('force', options, opts) end
	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

--> Edit Neovim config
map('n', '<leader>ve', '<cmd>vsplit ~/.config/nvim/init.lua<CR>')

--> Better window navigation
map('n', '<C-h>', '<C-w>h')
map('n', '<C-l>', '<C-w>l')
map('n', '<C-j>', '<C-w>j')
map('n', '<C-k>', '<C-w>k')

--> Better buffer navigation
map('n', '<S-h>', '<cmd>bprevious<CR>')
map('n', '<S-l>', '<cmd>bnext<CR>')

--> Insert Mode Navigation
map('i', '<C-l>', '<Right>')
map('i', '<C-h>', '<Left>')
map('i', '<C-,>', '<End>,<CR>')
map('i', '<C-;>', '<End>;<CR>')
map('i', '<C-CR>', '<Esc>o')

--> Next argument
map('i', "<C-'>", "<Esc>f'a, ''<Left>")
map('i', '<C-{>', "<Esc>f'a, {}<Left>")

--> Visual move
map('v', 'J', ":m '>+1<CR>gv=gv")
map('v', 'K', ":m '<-2<CR>gv=gv")

--> Keep cursor centered in screen
map('n', 'J', 'mzJ`z')
map('n', '<C-d>', '<C-d>zz')
map('n', '<C-u>', '<C-u>zz')
map('n', 'n', 'nzzzv')
map('n', 'N', 'Nzzzv')

--> Yank to system clipboard
map('n', '<Leader>y', '"+y')
map('n', '<leader>Y', '"+Y')
map('v', '<leader>y', '"+y')

--> Remove mapping for Q
map('n', 'Q', '<nop>')
