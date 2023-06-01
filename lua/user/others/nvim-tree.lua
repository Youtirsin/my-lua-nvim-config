local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
  return
end

nvim_tree.setup {
  diagnostics = {
    enable = true,
    show_on_dirs = true
  },
  update_focused_file = {
    enable = true,
  },
}

