local o = vim.opt
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- HACK: Worth doing a table to then iterate over?
--  In favor:
--		Is in a table?
--		Looks cooler?
--	Dark side:
--		Memory for the table?
--		Extra ms expended in iterating?
--		More lines of code?

--> Left side visual
o.number = true
o.relativenumber = false
o.numberwidth = 2
o.signcolumn = 'yes'
o.fillchars = { eob = ' ', fold = ' ' } --> remove end of buffer '~' chars

--> Indentation
o.tabstop = 2
o.shiftwidth = 2
o.softtabstop = 2
o.expandtab = false
o.list = true
o.listchars = 'trail:·,tab:  '
o.autoindent = true
o.smartindent = true
o.wrap = false

--> Splits
o.splitbelow = true
o.splitright = true

--> Folding
o.foldlevel = 5
o.foldmethod = 'expr'
o.foldexpr = 'nvim_treesitter#foldexpr()'

--> Colors
o.guifont = 'monospace:h17'
o.termguicolors = true
o.hlsearch = true
o.incsearch = true

--> Mouse
o.mousemoveevent = true

--> Editor
o.scrolloff = 8
o.sidescrolloff = 8
o.title = true
o.cursorline = true
o.cmdheight = 1

--> Others
o.timeoutlen = 200
o.isfname:append '@-@'
o.updatetime = 50
o.hidden = true
o.showmode = false

--> Swap
o.swapfile = false
o.backup = false
o.undofile = true
