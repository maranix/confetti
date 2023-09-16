local lsp_zero = require('lsp-zero')

require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = { 'gopls', 'tsserver' },
    handlers = {
        lsp_zero.default_setup,
    }
})