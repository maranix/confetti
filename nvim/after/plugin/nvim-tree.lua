local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Toggle Nvim-tree explorer window
map('n', '<C-b>', '<Cmd>:NvimTreeToggle<CR>', opts)
