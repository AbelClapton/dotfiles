local mason_ok, mason = pcall(require, 'mason')
if not mason_ok then return end

mason.setup {
	ui = {
		check_outdated_packages_on_open = false,
		border = 'rounded',
		icons = {
			package_installed = '◍',
			package_pending = '◍',
			package_uninstalled = '◍',
		},
	},
	log_level = vim.log.levels.INFO,
	max_concurrent_installers = 4
}
