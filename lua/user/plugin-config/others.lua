require("onedark").setup {
  style = 'darker'
}

require('onedark').load()

require("bufferline").setup {}
require("gitsigns").setup {}


require("lualine").setup {
  options = {
    theme = "horizon",
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
