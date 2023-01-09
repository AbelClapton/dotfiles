local o = vim.opt
vim.g.mapleader = ' '

--> Left side visual
o.number = true
o.relativenumber = false
o.numberwidth = 2
o.signcolumn = 'yes'
o.fillchars = { eob = ' ', fold = ' ' } --> remove end of buffer '~' chars

--> Indentation
o.tabstop = 2 -- of columns of whitespaces a \t is worth
o.shiftwidth = 2 -- columns of whitespace a 'level of indentation' is worth
o.softtabstop = 2 -- columns of whitespace is a tab or a backspace keypress worth
o.expandtab = false -- tabs keypresses will be expanded into spaces
o.list = true -- print indentation characters
o.listchars = 'trail:·,tab:  '
o.autoindent = true
o.smartindent = true
o.wrap = false

--> Splits
o.splitbelow = true
o.splitright = true

--> Folding
o.foldmethod = 'expr'
o.foldexpr = 'nvim_treesitter#foldexpr()'

--> Colors
o.termguicolors = true
o.hlsearch = true
o.incsearch = true

--> Mouse
o.mousemoveevent = true

--> Others
o.timeoutlen = 300
o.scrolloff = 8
o.isfname:append('@-@')
o.updatetime = 50

--> Swap
o.swapfile = false
o.backup = false
o.undofile = true
