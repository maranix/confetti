local M = {}

function M.set_leader_key(keymap)
    vim.g.mapleader = keymap
end

return M