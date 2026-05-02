vim.api.nvim_create_autocmd('PackChanged', {
  callback = function(ev)
    local name = ev.data.spec.name
    local kind = ev.data.kind

    if name == 'telescope-fzf-native.nvim'
       and (kind == 'install' or kind == 'update') then

      -- ensure plugin is loaded
      if not ev.data.active then
        vim.cmd.packadd(name)
      end

      -- run build
      print("AAA")
      local path = ev.data.path
      vim.system({ 'make' }, { cwd = path }):wait()
    end
  end,
})

vim.pack.add {
    "https://github.com/nvim-telescope/telescope.nvim",
    "https://github.com/nvim-lua/plenary.nvim",
    "https://github.com/nvim-telescope/telescope-fzf-native.nvim", -- better perf
}

require("telescope").setup {
    pickers = {
        find_files = {
            theme = "ivy",
        },
    },
    extensions = {
        fzf = {
            fuzzy = true,                    -- false will only do exact matching
            override_generic_sorter = true,  -- override the generic sorter
            override_file_sorter = true,     -- override the file sorter
            case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
            -- the default case_mode is "smart_case"
        }
    }
}
require("telescope").load_extension('fzf')

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>ps', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set({'n', 'v'}, '<C-G>', builtin.grep_string, { desc = 'Telescope grep string under cursor' })
vim.keymap.set('n', '<leader>pd', builtin.diagnostics, { desc = 'Telescope diagnostics' })
vim.keymap.set('n', '<leader>h', builtin.help_tags, { desc = 'Telescope help tags' })
-- vim.keymap.set('v', '<leader>pg', builtin.git_bcommits_range, { desc = 'Telescope git commits' })
