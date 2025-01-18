return {
  {
    'stevearc/oil.nvim',

    config = function()
      require('oil').setup()
      vim.keymap.set('n', '-', '<CMD>Oil --float<CR>', { desc = 'Open parent directory' })
      vim.keymap.set('n', '_', '<CMD>Oil . --float<CR>', { desc = 'Open project root directory' })
    end,
  },
}
