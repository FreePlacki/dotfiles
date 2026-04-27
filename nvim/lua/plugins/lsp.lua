vim.pack.add({
	"https://github.com/neovim/nvim-lspconfig",
})

vim.lsp.enable('clangd')
vim.lsp.enable('rust-analyzer')

vim.opt.autocomplete = true
