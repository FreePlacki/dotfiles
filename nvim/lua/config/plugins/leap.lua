return {
  {
    "ggandor/leap.nvim",
    config = function()
      require('leap')

      vim.keymap.set({ 'n', 'x', 'o' }, 's', '<Plug>(leap)')
      vim.keymap.set('n', 'S', '<Plug>(leap-from-window)')
      -- vim.keymap.set('n', 's', '<Plug>(leap-anywhere)')
    end
  }
}
