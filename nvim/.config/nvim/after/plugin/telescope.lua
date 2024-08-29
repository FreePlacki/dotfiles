local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, {}) -- use git_files to see just tracked files
vim.keymap.set("n", "<leader>pr", "<Cmd>Telescope frecency workspace=CWD<CR>")
vim.keymap.set('n', '<leader>ps', builtin.live_grep, {})
vim.keymap.set('n', '<leader>pt', vim.cmd.TodoTelescope, {})
