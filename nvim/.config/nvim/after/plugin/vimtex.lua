vim.g.vimtex_view_method = 'zathura'
-- vim.g.vimtex_syntax_enabled = 0
vim.g.vimtex_quickfix_mode = 0
vim.g.vimtex_build_dir = 'build'
vim.g.vimtex_aux_dir = 'build'
vim.opt.conceallevel = 2

vim.g.vimtex_compiler_method = 'latexmk'
vim.g.vimtex_compiler_latexmk = {
    executable = 'latexmk',
    -- options = { '-xelatex', '-shell-escape', '-pdf', '-verbose', '-file-line-error', '-synctex=1', '-interaction=nonstopmode' },
    options = {'-xelatex', '-shell-escape', '-file-line-error', '-synctex=1', '-interaction=nonstopmode'},
    -- '-aux-directory="build"'
    -- latexmk = {
    --     executable = 'xelatex',
    -- },
}
