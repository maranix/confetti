local cmp = require("config.cmp")
local lsp = require("config.lsp")
local mason = require("config.mason")

return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
    },
    config = function ()
        mason.setup()
        cmp.setup()
        lsp.setup()
    end
}
