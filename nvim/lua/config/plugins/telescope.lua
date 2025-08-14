return {
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
      'nvim-telescope/telescope-ui-select.nvim',
    },
    config = function()
      require("telescope").setup({
        extensions = {
          fzf = {},
          ["ui-select"] = {
            require("telescope.themes").get_cursor({})
          },
        }
      })

      require("telescope").load_extension("fzf")
      require("telescope").load_extension("ui-select")
    end
  },
}
