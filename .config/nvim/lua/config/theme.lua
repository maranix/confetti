local M = {}

function M.set_theme(theme_name)
    local theme = string.format("colorscheme %s", theme_name)

    if theme_name == "gruvbox-material" then
        Gruvbox()

        vim.cmd(theme)
    end
end

function Gruvbox()
    vim.g.gruvbox_material_background = "hard"
    vim.g.gruvbox_better_performance = "1"
end

return M
