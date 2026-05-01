vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '>-2<CR>gv=gv")

-- vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- jump only on error and warning, to avoid jumping to harper diagnostics
vim.keymap.set("n", "]d",
  function() vim.diagnostic.jump { count = 1, float = true, severity = { vim.diagnostic.severity.ERROR, vim.diagnostic.severity.WARN } } end)
vim.keymap.set("n", "[d",
  function() vim.diagnostic.jump { count = -1, float = true, severity = { vim.diagnostic.severity.ERROR, vim.diagnostic.severity.WARN } } end)

