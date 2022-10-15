local opts = { noremap = true, silent = true }

vim.g.mapleader = ' '

-- Make clipboard available globally
vim.opt.clipboard = 'unnamedplus'

--
-- Colorscheme
--
if vim.fn.has('termguicolors') == 1 then
	vim.cmd("set termguicolors")
end

vim.cmd("set background=dark")
vim.g.gruvbox_material_background = 'hard'
vim.g.gruvbox_material_foreground = 'original'
vim.g.gruvbox_material_enable_bold = 1
vim.g.gruvbox_material_transparent_background = 1
vim.g.gruvbox_material_better_performance = 1
vim.cmd("colorscheme gruvbox-material")

--
-- Keybinds
--

-- LazyGit
vim.api.nvim_set_keymap('n', '<leader>gg', '<Cmd>:LazyGit<CR>', opts)

-- Nvim-Tree
vim.api.nvim_set_keymap('n', '<leader>ee', '<Cmd>:NvimTreeToggle<CR>', opts)

-- Bufferline
-- A is ALT button
-- Cycle between Prev/Next Buffer
--
vim.api.nvim_set_keymap('n', '<A-left>', '<Cmd>BufferLineCyclePrev<CR>', opts)
vim.api.nvim_set_keymap('n', '<A-right>', '<Cmd>BufferLineCycleNext<CR>', opts)
vim.api.nvim_set_keymap('n', '<A-h>', '<Cmd>BufferLineCyclePrev<CR>', opts)
vim.api.nvim_set_keymap('n', '<A-l>', '<Cmd>BufferLineCycleNext<CR>', opts)

-- Close Current Buffer & Remove from Register
--
vim.api.nvim_set_keymap('n', '<A-c>', '<Cmd>bdelete!<CR>', opts)

-- Goto Tab & Close Tab
-- 
vim.api.nvim_set_keymap('n', '<leader>bgt', '<Cmd>BufferLinePick<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>bp', '<Cmd>BufferLinePickClose<CR>', opts)
