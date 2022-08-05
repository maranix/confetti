local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Remap Leader key to Spacebar
vim.g.mapleader = ' '

-- LazyGit
map('n', '<leader>gg', '<Cmd>:LazyGit<CR>', opts)

-- Make clipboard available globally
vim.opt.clipboard = 'unnamedplus'
