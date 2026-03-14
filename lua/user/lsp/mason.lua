local mason_status_ok, mason = pcall(require, "mason")
if not mason_status_ok then
    print("Mason not found")
    return
end

local ml_status_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not ml_status_ok then
    print("Mason-LSPConfig not found")
    return
end

mason.setup()

mason_lspconfig.setup({
    ensure_installed = { "lua_ls", "gopls", "jedi_language_server" },
    automatic_installation = true,
})

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
    print("lspconfig not found")
    return
end

-- Fix Treesitter tar error here too
require('nvim-treesitter.install').prefer_git = true

-- THE FIX: Check if setup_handlers exists before calling it
if mason_lspconfig.setup_handlers then
    mason_lspconfig.setup_handlers({
        function(server_name)
            local opts = {
                on_attach = require("user.lsp.handlers").on_attach,
                capabilities = require("user.lsp.handlers").capabilities,
            }
            lspconfig[server_name].setup(opts)
        end,
    })
else
    print("Critical: setup_handlers is nil. Your mason-lspconfig plugin is likely corrupted or outdated.")
end
