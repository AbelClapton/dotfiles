local M = {}

function M.collapse_all() require('nvim-tree.actions.tree-modifiers.collapse-all').fn() end

function M.edit_or_open()
	-- open as vsplit on current node
	local action = 'edit'
	local node = require('nvim-tree.lib').get_node_at_cursor()

	-- Just copy what's done normally with vsplit
	if node.link_to and not node.nodes then
		require('nvim-tree.actions.node.open-file').fn(action, node.link_to)
		-- require('nvim-tree.view').close() -- Close the tree if file was opened
	elseif node.nodes ~= nil then
		require('nvim-tree.lib').expand_or_collapse(node)
	else
		require('nvim-tree.actions.node.open-file').fn(action, node.absolute_path)
		-- require('nvim-tree.view').close() -- Close the tree if file was opened
	end
end

function M.vsplit_preview()
	-- open as vsplit on current node
	local action = 'vsplit'
	local node = require('nvim-tree.lib').get_node_at_cursor()

	-- Just copy what's done normally with vsplit
	if node.link_to and not node.nodes then
		require('nvim-tree.actions.node.open-file').fn(action, node.link_to)
	elseif node.nodes ~= nil then
		require('nvim-tree.lib').expand_or_collapse(node)
	else
		require('nvim-tree.actions.node.open-file').fn(action, node.absolute_path)
	end

	-- Finally refocus on tree if it was lost
	require('nvim-tree.view').focus()
end

function M.git_add()
	local node = require('nvim-tree.lib').get_node_at_cursor()
	local gs = node.git_status

	-- If the file is untracked, unstaged or partially staged, we stage it
	if gs == '??' or gs == 'MM' or gs == 'AM' or gs == ' M' then
		vim.cmd('silent !git add ' .. node.absolute_path)

	-- If the file is staged, we unstage
	elseif gs == 'M ' or gs == 'A ' then
		vim.cmd('silent !git restore --staged ' .. node.absolute_path)
	end

	require('nvim-tree.lib').refresh_tree()
end

return M
