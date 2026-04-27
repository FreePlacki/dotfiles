vim.pack.add {
    "file:///home/freeplacki/coding/halberd.nvim"
}

local halberd = require("halberd")

vim.keymap.set("n", "<leader>a", halberd.mark_current_file, { desc = "Add current file to tracker" })
vim.keymap.set("n", "<leader>e", halberd.open_tracker_file, { desc = "Open tracker file" })
vim.keymap.set("n", "<C-h>", function() halberd.open_marked_file(1) end, { desc = "Open file 1 from tracker" })
vim.keymap.set("n", "<C-j>", function() halberd.open_marked_file(2) end, { desc = "Open file 2 from tracker" })
vim.keymap.set("n", "<C-k>", function() halberd.open_marked_file(3) end, { desc = "Open file 3 from tracker" })
