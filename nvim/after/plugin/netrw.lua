local map = vim.api.nvim_set_keymap
local opts = { silent = true, noremap = true }

vim.g.netrw_keepdir = 0
vim.g.netrw_winsize = 20
vim.g.netrw_banner = 0
vim.g.netrw_localcopydircmd = 'cp -r'

map('n', '<C-e>', '<Cmd>:Lexplore<CR>', opts)
