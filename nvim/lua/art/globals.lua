local f = require 'art.utils.functions'

f.autocmd(
	'BufWritePost',
	'AutoReloadKitty',
	'kitty.conf',
	function() vim.cmd 'silent !kill -SIGUSR1 $(pgrep kitty)' end
)

f.autocmd(
	'BufWritePost',
	'AutoReloadFish',
	'config.fish',
	function() vim.cmd 'silent !source ~/.config/fish/config.fish' end
)
