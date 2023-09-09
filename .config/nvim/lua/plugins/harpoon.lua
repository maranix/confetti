local harpoon = require("config.harpoon")

return {
    "ThePrimeagen/harpoon",
    config = function()
        harpoon.setup()
    end,
    dependencies = {
        'nvim-lua/plenary.nvim',
    }
}
