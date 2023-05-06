local lspconfig = require('lspconfig')

-- Set up lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities()

local servers = { "pyright", "lua_ls", "clangd" }

for _, p in pairs(servers) do
  lspconfig[p].setup {
    capabilities = capabilities
  }
end
