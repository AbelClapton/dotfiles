-- GLOBALS
function P(arg) print(vim.inspect(arg)) end
local api = vim.api

local M = {}

function M.is_empty(s) return s == nil or s == '' or s == {} end

function M.tbl_join(a, b)
	return vim.tbl_deep_extend('force', a, b)
end

function M.buf_get_var(bufnr, name)
	local status_ok, var = pcall(api.nvim_buf_get_var, bufnr, name)
	if status_ok then return var end
end

function M.get_buf_option(opt)
	local status_ok, option = pcall(api.nvim_buf_get_option, 0, opt)
	if status_ok then return option end
end

function M.set_buf_option(name, value, opts) pcall(api.nvim_set_option_value, name, value, opts) end

function M.get_winbar()
	local status_ok, navic = pcall(require, 'navic')
	if navic.is_available() then
    return "%#WinBarSeparator#"
      .. "%="
      .. ""
      .. "%*"
      .. get_modified()
      .. get_location()
      .. "%#WinBarSeparator#"
      .. ""
      .. "%*"
  else
    return "%#WinBarSeparator#" .. "%=" .. "" .. "%*" .. get_modified() .. "%#WinBarSeparator#" .. "" .. "%*"
  end
end

return M
