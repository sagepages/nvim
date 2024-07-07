local servers = {
  'lua_ls', 'tsserver', 'gopls',
}

require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})
require('mason-lspconfig').setup({
  ensure_installed = servers,
  automatic_installation = true,
})


local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
  return
end


-- require('mason-lspconfig').setup_handlers {
--   function (server_name)
--     lspconfig[server_name].setup {
--       on_attach = require("user.lsp.handlers").on_attach,
--       capabilities = require("user.lsp.handlers").capabilities,
--     }
--   end,
-- }

for _, server in pairs(servers) do
  local opts = {
    on_attach = require("user.lsp.handlers").on_attach,
    capabilities = require("user.lsp.handlers").capabilities,
  }
  lspconfig[server].setup(opts)
end
