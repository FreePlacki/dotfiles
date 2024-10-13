local lsp = require('lsp-zero')
lsp.extend_lspconfig({
    sign_icons = {},
})

require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = {'clangd'},

    handlers = {
      function(server_name)
        require('lspconfig')[server_name].setup({})
      end,
    },
})

vim.diagnostic.config({
    virtual_text = false,
})

require("lspconfig").pylsp.setup({
    settings = {
        pylsp = {
            plugins = {
                jedi = {
                    environment = "/sbin/python"
                }
            }
        }
    }
})

-- run clippy on save
require("lspconfig").rust_analyzer.setup({
    settings = {
        ["rust-analyzer"] = {
            check = {
                command = "clippy"
            }
        }
    }
})


local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()
local cmp_mappings = cmp.mapping.preset.insert({
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ['<Tab>'] = cmp_action.luasnip_supertab(),
    ['<S-Tab>'] = cmp_action.luasnip_shift_supertab(),
})

cmp.setup({
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    experimental = {
        ghost_text = true,
    },
    mapping = cmp_mappings,
})

lsp.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }

    vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<leader>f", function() vim.lsp.buf.format() end, opts)
end)

lsp.setup()
