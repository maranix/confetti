local fugitive = require("config.fugitive")

return {
    "tpope/vim-fugitive",
    config = function()
        fugitive.setup()
    end
}
