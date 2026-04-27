vim.pack.add{
	"https://github.com/stevearc/oil.nvim",
    "https://github.com/echasnovski/mini.icons"
}

require("oil").setup {
    view_options = {
        show_hidden = true,
        is_always_hidden = function(name, bufnr)
            return name == ".."
        end
    },
}

vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
