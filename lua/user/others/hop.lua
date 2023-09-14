local status_ok, hop = pcall(require, "hop")
if not status_ok then
	return
end

hop.setup {
}

vim.keymap.set('', '<leader>w', "<cmd>HopWord<cr>")
vim.keymap.set('', '<leader>j', "<cmd>HopLineStart<cr>")

