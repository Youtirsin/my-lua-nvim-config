local servers = {
	"clangd",
	"lua_ls",
	"pyright",
}

require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = servers,
	automatic_installation = true,
})

local status_cmp_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_cmp_ok then
	return
end

-- The nvim-cmp almost supports LSP's capabilities so You should advertise it to LSP servers..
local capabilities = cmp_nvim_lsp.default_capabilities()

require("mason-lspconfig").setup_handlers({
   -- The first entry (without a key) will be the default handler
   -- and will be called for each installed server that doesn't have
   -- a dedicated handler.
   function (server_name) -- default handler (optional)
      require("lspconfig")[server_name].setup {
        capabilities = capabilities
      }
   end,
   -- Next, you can provide targeted overrides for specific servers.
   -- ["rust_analyzer"] = function ()
   --     require("rust-tools").setup {}
   -- end,
   -- ["lua_ls"] = function ()
   --     lspconfig.lua_ls.setup {
   --         settings = {
   --             Lua = {
   --                 diagnostics = {
   --                     globals = { "vim" }
   --                 }
   --             }
   --         }
   --     }
   -- end,
})


