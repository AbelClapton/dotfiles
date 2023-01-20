local f = require 'art.utils.functions'

f.autocmd(
	'BufWritePost',
	'AutoReloadKitty',
	'kitty.conf',
	function() vim.cmd 'silent !kill -SIGUSR1 $(pgrep kitty)' end
)
-- f.autocmd('BufWritePost', 'AutoReloadTermux', '~/.tmux.conf', function()
-- 	vim.cmd('silent !tmux source-file ~/.tmux.conf ; tmux display-message "Reloaded Config!')
-- end)
