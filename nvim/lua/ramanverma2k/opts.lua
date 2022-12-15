vim.opt.nu = true

-- Relative line numbers
vim.opt.relativenumber = true

-- Tab length
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2

-- Replace tabs with spaces
vim.opt.expandtab = true

vim.opt.smartindent= true
vim.opt.autoindent= true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

-- Reserve space for diagnostic icons
vim.opt.signcolumn = 'yes'
