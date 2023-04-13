local colorscheme = "onedark"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  return
end

-- calls basic setup
local plugins = {
  "bufferline",
  "Comment",
  "gitsigns",
  "lualine",
}

for _, p in pairs(plugins) do
  local ok, plugin = pcall(require, p)
  if not ok then
    return
  end

  plugin.setup {}
end

require("session_manager").setup({
  autoload_mode = require('session_manager.config').AutoloadMode.CurrentDir
})


require("symbols-outline").setup({
  auto_close = true,
})

