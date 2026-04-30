-- IMPORTANT: requires tree-sitter-cli to be installed (tree-sitter binary in path)
vim.pack.add({
    "https://github.com/romus204/tree-sitter-manager.nvim"
})

require("tree-sitter-manager").setup {
	auto_install = true
}
