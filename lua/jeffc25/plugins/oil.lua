return {
  {
    'stevearc/oil.nvim',

    config = function()
      require('oil').setup({
        float = {
          border = 'none',
          padding = 8,
        },
        confirmation = {
          border = 'none',
          padding = 8,
        },
      })
      vim.keymap.set('n', '<leader>o', '<CMD>Oil --float<CR>', { desc = 'Open parent directory' })
      vim.keymap.set('n', '<leader>O', '<CMD>Oil . --float<CR>', { desc = 'Open project root directory' })
    end,
  },
}
