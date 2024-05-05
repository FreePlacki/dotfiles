local lsp = require('lsp-zero')
lsp.preset("recommended")

vim.diagnostic.config({
    virtual_text = false,
})

lsp.ensure_installed({
    'rust_analyzer',
    'lua_ls',
    'pylsp',
    'zls',
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

-- require("lspconfig").pyright.setup({
--     settings = {
--         pyright = {
--             python = {
--                 analysis = {
--                     useLibraryCodeForTypes = true,
--                     diagnosticSeverityOverrides = {
--                         reportGeneralTypeIssues = "none",
--                         reportOptionalMemberAccess = "none",
--                         reportOptionalSubscript = "none",
--                         reportPrivateImportUsage = "none",
--                     },
--                 },
--             },
--         },
--     },
-- })

-- local ls = require('luasnip')
-- local snip = ls.snippet
-- local node = ls.snippet_node
-- local text = ls.text_node
-- local insert = ls.insert_node
-- local func = ls.function_node
-- local choice = ls.choice_node
-- local dynamicn = ls.dynamic_node
--
-- local date = function() return {os.date('%Y-%m-%d')} end
--
-- ls.add_snippets(nil, {
--     all = {
--         snip({
--             trig = "date",
--             namr = "Date",
--             dscr = "Date in the form of YYYY-MM-DD",
--         }, {
--             func(date, {}),
--         }),
--     },
-- })

local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()
local cmp_mappings = lsp.defaults.cmp_mappings({
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
})

lsp.set_preferences({
    sign_icons = {}
})

lsp.setup_nvim_cmp({
    mapping = cmp_mappings
})

lsp.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }

    vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<leader>f", function() vim.lsp.buf.format() end, opts)
end)

lsp.setup()
