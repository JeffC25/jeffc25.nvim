return {
  { 'JeffC25/season.nvim', opt = { terminal = true } },
  -- { dir = '~/dev/nvim/season.nvim/', opt = { terminal = true } },
  { 'folke/tokyonight.nvim' },
  { 'Shatur/neovim-ayu', opt = { terminal = true } },
  { 'rose-pine/neovim', name = 'rose-pine' },
  { 'navarasu/onedark.nvim' },
  { 'nuvic/flexoki-nvim' },
  { 'UtkarshVerma/molokai.nvim' },
  { 'catppuccin/nvim', name = 'catppuccin' },
  { 'ellisonleao/gruvbox.nvim' },
  { 'loctvl842/monokai-pro.nvim' },
  { 'projekt0n/github-nvim-theme', name = 'github-theme' },
  { 'rmehri01/onenord.nvim', opt = { theme = 'light' } },

  {
    'zenbones-theme/zenbones.nvim',
    priority = 1000,
    config = function()
      vim.g.zenbones_darken_comments = 45
      vim.cmd.background = 'light'
    end,
  },
  {
    'marko-cerovac/material.nvim',
    priority = 1000,
    config = function()
      require('material').setup({ lualine_style = 'stealth' })
      vim.g.material_style = 'darker'
    end,
  },

  { 'rktjmp/lush.nvim' },
  {
    'catgoose/nvim-colorizer.lua',
    event = 'BufReadPre',
    opts = { user_default_options = { names = false } },
  },
  {
    'f-person/auto-dark-mode.nvim',
    opts = {
      set_dark_mode = function()
        vim.cmd.colors('material-darker')
      end,
      set_light_mode = function()
        vim.cmd.colors('season')
      end,
    },
  },
}

-- vim: ts=2 sts=2 sw=2 et
