return {
  {
    'JeffC25/season.nvim',
    -- dir = '~/dev/nvim/season.nvim/',
    priority = 1000,
    config = function()
      require('season').setup({
        terminal = true,
      })
      -- vim.cmd.colors('season')
    end,
  },
  {
    'Shatur/neovim-ayu',
    priority = 1000,
    config = function()
      require('ayu').setup({
        terminal = true,
      })
      -- vim.cmd.colors('ayu-dark')
    end,
  },
  -- {
  --   'rose-pine/neovim',
  --   name = 'rose-pine',
  --   config = function()
  --     vim.cmd('colorscheme rose-pine-dawn')
  --   end,
  -- },
  -- {
  --   'zenbones-theme/zenbones.nvim',
  --   dependencies = 'rktjmp/lush.nvim',
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     vim.g.zenbones_darken_comments = 45
  --     vim.cmd.background = 'light'
  --     vim.cmd.colorscheme('zenwritten')
  --   end,
  -- },
  -- {
  --   'JeffC25/neovim-ayu-custom',
  --   -- dir = '~/dev/nvim/neovim-ayu/',
  --   priority = 1000,
  --   config = function()
  --     require('ayu').setup({
  --       terminal = true,
  --     })
  --     vim.cmd.colors('ayu')
  --   end,
  -- },
  -- {
  --   'marko-cerovac/material.nvim',
  --   priority = 1000,
  --   config = function()
  --     require('material').setup({
  --       -- lualine_style = 'stealth',
  --       high_visibility = {
  --         lighter = true,
  --         darker = false,
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
  --   'nuvic/flexoki-nvim',
  --   priority = 1000,
  --   config = function()
  --     vim.cmd.colorscheme('flexoki-dawn')
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
  --   vim.cmd.colorscheme('catppuccin-latte')
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
  -- {
  --   'projekt0n/github-nvim-theme',
  --   name = 'github-theme',
  --   lazy = false, -- make sure we load this during startup if it is your main colorscheme
  --   priority = 1000, -- make sure to load this before all the other start plugins
  --   config = function()
  --     require('github-theme').setup({
  --       -- ...
  --     })
  --
  --     vim.cmd('colorscheme github_light')
  --   end,
  -- },
  -- {
  --   'rmehri01/onenord.nvim',
  --   config = function()
  --     require('onenord').setup({
  --       theme = 'light'
  --     })
  --     vim.cmd.colorscheme('onenord')
  --   end,
  -- },
  {
    'catgoose/nvim-colorizer.lua',
    event = 'BufReadPre',
    opts = {
      user_default_options = {
        names = false,
      },
    },
  },
  {
    'f-person/auto-dark-mode.nvim',
    opts = {
      set_dark_mode = function()
        vim.cmd.colors('ayu-dark')
      end,
      set_light_mode = function()
        vim.cmd.colors('season')
      end,
    },
  },
}

-- vim: ts=2 sts=2 sw=2 et
