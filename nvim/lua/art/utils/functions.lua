-- GLOBALS
function P(arg) print(vim.inspect(arg)) end
local api = vim.api

local M = {}

---Checks for falsy values
---@param s string|table
---@return boolean
function M.is_empty(s) return s == nil or s == '' or s == {} end

---Wrapper for vim.api.nvim_create_autocmd()
---@param events string|string[]
---@param group string
---@param pattern string|string[]
---@param callback function
function M.autocmd(events, group, pattern, callback)
	api.nvim_create_autocmd(events, {
		group = api.nvim_create_augroup(group, { clear = true }),
		pattern = pattern,
		callback = callback,
	})
end

---Merges two tables
---@param a table
---@param b table
---@return table
function M.tbl_join(a, b) return vim.tbl_deep_extend('force', a, b) end

---Wrapper for vim.api.nvim_buf_get_var()
---@param name string
---@return string|nil
function M.get_buf_var(name)
	local status_ok, var = pcall(api.nvim_buf_get_var, 0, name)
	if status_ok then return var end
end

---Wrapper for vim.api.nvim_buf_get_option()
---@param opt string
---@return string|nil
function M.get_buf_option(opt)
	local status_ok, option = pcall(api.nvim_buf_get_option, 0, opt)
	if status_ok then return option end
end

---Wrapper for vim.api.nvim_buf_set_option()
---@param name string
---@param value any
---@param opts table
function M.set_buf_option(name, value, opts) pcall(api.nvim_set_option_value, name, value, opts) end

function M.get_navic()
	local status_ok, navic = pcall(require, 'nvim-navic')
	if status_ok and navic.is_available() then return navic.get_location() end
	return ''
end

return M
