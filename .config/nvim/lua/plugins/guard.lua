local guard = require("config.guard")

return {
    "nvimdev/guard.nvim",
    config = function()
        guard.setup()
    end
}
