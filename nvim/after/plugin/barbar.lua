local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- A is ALT button

-- Move to previous/next
map('n', '<A-left>', '<Cmd>BufferPrevious<CR>', opts)
map('n', '<A-right>', '<Cmd>BufferNext<CR>', opts)
map('n', '<A-h>', '<Cmd>BufferPrevious<CR>', opts)
map('n', '<A-l>', '<Cmd>BufferNext<CR>', opts)

-- Close buffer
map('n', '<A-c>', '<Cmd>BufferClose<CR>', opts)
