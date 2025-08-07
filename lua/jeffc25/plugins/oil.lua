return {
  {
    'refractalize/oil-git-status.nvim',
    config = true,
  },
  {
    'stevearc/oil.nvim',

    config = function()
      require('oil').setup({
        win_options = {
          signcolumn = 'yes:2',
        },
        skip_confirm_for_simple_edits = true,
      })
      vim.keymap.set('n', '<leader>o', '<CMD>Oil --float<CR>', { desc = 'Open parent directory' })
      vim.keymap.set('n', '<leader>O', '<CMD>Oil . --float<CR>', { desc = 'Open project root directory' })
    end,
  },
}
