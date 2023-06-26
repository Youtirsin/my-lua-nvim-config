vim.cmd([[colorscheme catppuccin-macchiato]])

vim.cmd([[highlight Normal guibg=none]])
vim.cmd([[highlight NonText guibg=none]])

require("notify").setup({
  background_colour = "#000000"
})

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

require("Comment").setup {
}
