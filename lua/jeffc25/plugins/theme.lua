-- Color schemes

return { {
  'loctvl842/monokai-pro.nvim',
  lazy = false,
  priority = 1000,
  config = function()
    vim.cmd.colorscheme('monokai-pro')
  end,
} }

-- vim: ts=2 sts=2 sw=2 et
