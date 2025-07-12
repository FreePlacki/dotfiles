vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '>-2<CR>gv=gv")

vim.keymap.set("v", "<leader>x", ":lua<CR>")

vim.keymap.set("n", "-", "<CMD>Oil<CR>")

vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)
vim.keymap.set("n", "]d", function() vim.diagnostic.jump {count = 1, float = true} end)
vim.keymap.set("n", "[d", function() vim.diagnostic.jump {count = -1, float = true} end)

vim.keymap.set("n", "<leader>pf", require("telescope.builtin").find_files)
vim.keymap.set("n", "<leader>ps", require("telescope.builtin").live_grep)
vim.keymap.set("n", "<leader>h", require("telescope.builtin").help_tags)
