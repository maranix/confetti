local map = vim.api.nvim_set_keymap
local opts = { noremap = true }

map('n', '<C-e>', '<Cmd>:NERDTreeToggle<CR>', opts)
