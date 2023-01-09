function _G.ReloadConfig()
  for name,_ in pairs(package.loaded) do
    if name:match('^user') then
      package.loaded[name] = nil
    end
  end

  dofile(vim.env.MYVIMRC)
end
vim.cmd 'command! ReloadConfig lua ReloadConfig()'

vim.api.nvim_create_autocmd('BufWritePost', {
	pattern = '*.lua',
	callback = function()
		local s = vim.api.nvim_buf_get_name(0)
		if string.match(s, 'user') ~= nil then
			vim.cmd 'luafile %'
		end
	end,
	group = vim.api.nvim_create_augroup('ReloadConfig', {
		clear = true
	}),
})
