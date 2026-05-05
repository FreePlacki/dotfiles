local formatters = {
    go = function() vim.cmd("!go fmt %") end,
    rust = function() vim.cmd("!cargo fmt") end,
    c = function() vim.cmd("!clang-format -i %") end,
    cpp = function() vim.cmd("!clang-format -i %") end,
    cuda = function() vim.cmd("!clang-format -i %") end,
}

vim.api.nvim_create_autocmd("FileType", {
    pattern = "*",
    callback = function(args)
        local ft = args.match
        local fn = formatters[ft]
        if not fn then return end

        vim.api.nvim_buf_set_keymap(0, 'n', '<leader>f', '', {
            noremap = true,
            silent = true,
            callback = function()
                vim.cmd("write")
                fn()
            end,
        })
    end
})
