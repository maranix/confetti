local remap = require("ramanverma2k.keymap").remap

remap("n", "<leader>ff", "<cmd>lua require('telescope.builtin').find_files()<cr>")
remap("n", "<leader>fg", "<cmd>lua require('telescope.builtin').live_grep()<cr>")
remap("n", "<leader>fb", "<cmd>lua require('telescope.builtin').buffers()<cr>")
remap("n", "<leader>fh", "<cmd>lua require('telescope.builtin').help_tags()<cr>")
remap("n", "<leader>fd", "<cmd>lua require('telescope.builtin').diagnostics()<cr>")
