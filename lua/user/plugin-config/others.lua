vim.cmd([[colorscheme catppuccin-macchiato]])

require("bufferline").setup {}
require("gitsigns").setup {}

require("lualine").setup {
  options = {
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
  }
}

require("session_manager").setup({
  autoload_mode = require('session_manager.config').AutoloadMode.CurrentDir
})

require("symbols-outline").setup({
  auto_close = true,
})

require("Comment").setup {
}
