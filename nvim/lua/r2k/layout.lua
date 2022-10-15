-- vim.opt - Behaves like :set
local set = vim.opt

-- Set tabspaces and indentations to 2 spaces
set.tabstop = 2
set.shiftwidth = 2
set.softtabstop = 2

-- Replace tabs with spaces
set.expandtab = true

-- Enable line numbers
set.relativenumber = true

-- This is evil but i am leaving it here just-in-case.
-- Make mouse iteractable with windows and buffers.
-- set.mouse = 'a'
