require('lsp_lines').setup()

-- Disable virtual_text since it's redundant due to lsp_lines.
vim.diagnostic.config({
  virtual_text = false,
})

-- Enable virtual_lines plugin.
vim.diagnostic.config({ virtual_lines = true })
