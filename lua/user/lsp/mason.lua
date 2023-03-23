local servers = {
	"clangd",
	"lua_ls",
	"pyright",
	-- "jsonls",
}

require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = servers,
	automatic_installation = true,
})

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
	return
end

 require("mason-lspconfig").setup_handlers({
     -- The first entry (without a key) will be the default handler
     -- and will be called for each installed server that doesn't have
     -- a dedicated handler.
     function (server_name) -- default handler (optional)
         require("lspconfig")[server_name].setup {}
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

