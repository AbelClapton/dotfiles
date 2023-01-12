require("user.options")
require("user.keymaps")
require("user.autocmd")
require("user.plugins")

require("user.ui.whichkey")
require("user.ui.explorer")
require("user.ui.lualine")
require("user.ui.bufferline")
require("user.ui.colorscheme")
require("user.ui.highlights.treesitter")
require("user.ui.highlights.illuminate")

require("user.utils.todo-comments")
require("user.utils.pretty-folds")
require("user.utils.comments")
require("user.utils.functions")
require("user.utils.sniprun")

require("user.core.autocompletion")
require("user.core.lsp")
require("user.core.gitsigns")
require("user.core.project")

require("user.extras.zen-mode")
-- TODO: Create 'plugin' to hide eol comments and show it on hover/key-press
-- TODO: Upgrade folder structure
