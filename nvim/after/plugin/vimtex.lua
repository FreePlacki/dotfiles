vim.g.vimtex_view_method = 'zathura'
-- vim.g.vimtex_syntax_enabled = 0
vim.g.vimtex_quickfix_mode = 0
vim.opt.conceallevel = 2

vim.g.vimtex_compiler_method = 'latexmk'
vim.g.vimtex_compiler_latexmk = {
    executable = 'latexmk',
    options = {'-pdf', '-verbose', '-file-line-error', '-synctex=1', '-interaction=nonstopmode', '-aux-directory="build"'},
}

