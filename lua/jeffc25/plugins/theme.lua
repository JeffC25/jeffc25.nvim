
return {
{
  'catppuccin/nvim',
  name = 'catppuccin',
  priority = 1000,
  config = function()
    vim.cmd.colorscheme('catppuccin')
  end,
},
-- {
--   'ellisonleao/gruvbox.nvim',
--   priority = 1000,
--   config = function()
--     vim.cmd.colorscheme('gruvbox')
--   end,
-- },
-- {
--   'loctvl842/monokai-pro.nvim',
--   lazy = false,
--   priority = 1000,
--   config = function()
--     vim.cmd.colorscheme('monokai-pro')
--   end,
-- },
}

-- vim: ts=2 sts=2 sw=2 et
