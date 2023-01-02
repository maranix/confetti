local lsp = require('lsp-zero')

lsp.preset('recommended')

lsp.ensure_installed({
  -- Install libstdc++-12-dev if it isn't working properly
  -- This usually happens in Ubuntu 22.04 and related distros.
  'clangd',
  'gopls',
  'rust_analyzer',
  'sumneko_lua',
  'tsserver',
})

-- Lsp-Zero configuration
lsp.set_preferences({
  suggest_lsp_servers = false,
  sign_icons = {
    error = 'E',
    warn = 'W',
    hint = 'H',
    info = 'I'
  }
})

-- Force enable globally installed lsp client
lsp.configure(
  'dartls',
  { force_setup = true }
)

vim.diagnostic.config({
    virtual_text = true,
})

lsp.nvim_workspace()
lsp.setup()
