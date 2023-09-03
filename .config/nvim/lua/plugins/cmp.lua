return {
    "hrsh7th/nvim-cmp",         -- Autocompletion plugin
    "hrsh7th/cmp-nvim-lsp",     -- LSP source for nvim-cmp
    "saadparwaiz1/cmp_luasnip", -- Snippets source for nvim-cmp
    {
        "L3MON4D3/LuaSnip",
        -- follow latest release.
        version = "2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
        dependencies = { "rafamadriz/friendly-snippets" },
        config = function()
            require("luasnip").filetype_extend("dart", { "flutter" })
        end
    },
}
