local M = {}

function M.setup()
    local ft = require('guard.filetype')

    ft('typescript,javascript,typescriptreact,html,css,json,yaml,markdown,scss,vue'):fmt('prettier')

    require('guard').setup({
        -- the only options for the setup function
        fmt_on_save = true,
        -- Use lsp if no formatter was defined for this filetype
        lsp_as_default_formatter = false,
    })
end

return M
