return {
  {
    'Shatur/neovim-ayu',
    priority = 1000,
    config = function()
      require('ayu').setup({
        terminal = true,
        overrides = {},
      })
      vim.cmd.colors('ayu-light')
    end,
  },
  -- {
  --   'marko-cerovac/material.nvim',
  --   priority = 1000,
  --   config = function()
  --     require('material').setup({
  --       lualine_style = 'stealth',
  --       disable = {
  --         -- background = true
  --       },
  --       high_visibility = {
  --         lighter = true, -- Enable higher contrast text for lighter style
  --         darker = false, -- Enable higher contrast text for darker style
  --       },
  --     })
  --     vim.g.material_style = 'lighter'
  --     vim.cmd.colorscheme('material')
  --   end,
  -- },
  -- {
  --   'navarasu/onedark.nvim',
  --   priority = 1000,
  --   config = function()
  --     vim.cmd.colorscheme('onedark')
  --   end,
  -- },
  -- {
  --   'kepano/flexoki-neovim',
  --   priority = 1000,
  --   config = function()
  --     vim.cmd.colorscheme('flexoki-dark')
  --   end,
  -- },
  -- {
  --   'UtkarshVerma/molokai.nvim',
  --   priority = 1000,
  --   config = function()
  --     vim.cmd.colorscheme('molokai')
  --   end,
  -- },
  -- {
  -- 'catppuccin/nvim',
  -- name = 'catppuccin',
  -- priority = 1000,
  -- config = function()
  --   vim.cmd.colorscheme('catppuccin')
  -- end,
  -- },
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
