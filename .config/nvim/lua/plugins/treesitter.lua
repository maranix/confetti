local treesitter = require("config.treesitter")

return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function ()
        treesitter.setup()
    end
}
