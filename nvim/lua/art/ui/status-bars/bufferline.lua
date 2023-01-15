local status_ok, bufferline = pcall(require, 'bufferline')
if not status_ok then
	return
end

--> TODO: Copy config from lunarvim
bufferline.setup {
	options = {
		separator_style  = 'thin',
		hover = {
			enabled = true,
			delay = 200,
			reveal = { 'close' }
		}
	}
}
