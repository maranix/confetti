local lsp = require('lsp-zero')

lsp.preset('recommended')

lsp.ensure_installed({
  'gopls',
  'rust_analyzer',
  'sumneko_lua',
  'tsserver',
})

-- Force enable globally installed lsp client
lsp.configure(
  'dartls',
  { force_setup = true }
)

-- Lsp-Zero configuration
lsp.set_preferences({
  suggest_lsp_servers = false,
})

lsp.nvim_workspace()
lsp.setup()