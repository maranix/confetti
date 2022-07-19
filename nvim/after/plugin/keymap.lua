local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Remap Leader key to Spacebar
vim.g.mapleader = ' '

-- Float Term keybinds
map('n', '<leader>ftn' , '<Cmd>:FloatermNew<CR>', opts)
map('n', '<leader>fts' , '<Cmd>:FloatermShow<CR>', opts)
map('t', '<leader>ftt' , '<Cmd>:FloatermToggle<CR>', opts)
map('t', '<C-]>' , '<Cmd>:FloatermPrev<CR>', opts)
map('t', '<C-\\>' , '<Cmd>:FloatermNext<CR>', opts)
map('t', '<leader>ftk' , '<Cmd>:FloatermKill<CR>', opts)
map('t', '<Esc>', '<C-\\><C-n>', opts)

-- LazyGit
map('n', '<leader>gg', '<Cmd>:LazyGit<CR>', opts)

-- Make clipboard available globally
vim.opt.clipboard = 'unnamedplus'
