-- Color schemes

return { {
  'catppuccin/nvim',
  lazy = false,
  name = 'catppuccin',
  priority = 1000,
  config = function()
    vim.cmd.colorscheme('catppuccin')
  end,
} }

-- vim: ts=2 sts=2 sw=2 et
