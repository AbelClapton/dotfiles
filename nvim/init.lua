require 'art.options'
require 'art.keymaps'
require 'art.autocmd'

-- TODO: lazy load plugins
require 'art.plugins'

-- TODO: register plugins keymaps with whichkey
require 'art.ui.whichkey'
require 'art.ui.explorer'
require 'art.ui.status-bars'
require 'art.ui.colorscheme'
require 'art.ui.notifications'
require 'art.ui.highlights.treesitter'
require 'art.ui.highlights.illuminate'

require 'art.utils.todo-comments'
require 'art.utils.pretty-folds'
require 'art.utils.comments'
require 'art.utils.functions'
require 'art.utils.sniprun'

require 'art.core.completion'
require 'art.core.lsp'
require 'art.core.gitsigns'
require 'art.core.project'

require 'art.extras.zen-mode'

-- TODO: Create 'plugin' to hide eol comments and show it on hover/key-press? Got time?
-- TODO: Enhance folder structure
-- TODO: Transform configs files into modules, so is possible to implement lazy loading in packer
-- TODO: Migrate the cmp icons into the icons file
