-- Autostart COQ auto-completion
vim.g.coq_settings = {
  auto_start = 'shut-up',
}

-- Noswapfile
vim.o.swapfile = false

-- Disable python provider (I don't use python)
vim.g.loaded_python3_provider = 0
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0

require("ramanverma2k")
