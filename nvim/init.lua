-- Noswapfile
vim.o.swapfile = false

-- Disable python provider (I don't use python)
vim.g.loaded_python3_provider = 0
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0

-- Termguicolors
vim.opt.termguicolors = true

require("ramanverma2k")
