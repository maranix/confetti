local lsp = require("config.lsp")

local M = {}

function M.setup()
    require("mason").setup()
    require("mason-lspconfig").setup({
        ensure_installed = lsp.get_servers()
    })
end

return M