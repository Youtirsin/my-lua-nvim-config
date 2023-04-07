local status_ok, outline = pcall(require, "symbols-outline")
if not status_ok then
  return
end

require("symbols-outline").setup({
  auto_close = true,
})
