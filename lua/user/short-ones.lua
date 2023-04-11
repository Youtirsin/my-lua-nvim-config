local colorscheme = "onedark"

vim.cmd("colorscheme " ..colorscheme)

local plugins = {
  "bufferline",
  "Comment",
  "gitsigns",
}

-- calls basic setup
for _, p in pairs(plugins) do
  require(p).setup {}
end

require("session_manager").setup({
  autoload_mode = require('session_manager.config').AutoloadMode.CurrentDir
})


require("symbols-outline").setup({
  auto_close = true,
})

require("lualine").setup {
  options = {
    theme = 'horizon',
  }
}

