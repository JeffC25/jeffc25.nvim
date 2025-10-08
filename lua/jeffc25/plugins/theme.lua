return {
  { 'JeffC25/season.nvim', opt = { terminal = true } },
  -- { dir = '~/dev/nvim/season.nvim/', opt = { terminal = true } },
  { 'folke/tokyonight.nvim' },
  { 'EdenEast/nightfox.nvim' },
  { 'Shatur/neovim-ayu', opt = { terminal = true } },
  { 'rose-pine/neovim', name = 'rose-pine' },
  { 'navarasu/onedark.nvim', opt = { style = 'darker' } },
  -- { 'nuvic/flexoki-nvim' },
  { 'kepano/flexoki-neovim', name = 'flexoki' },
  { 'neanias/everforest-nvim' },
  { 'catppuccin/nvim', name = 'catppuccin' },
  { 'ellisonleao/gruvbox.nvim' },
  { 'loctvl842/monokai-pro.nvim' },
  { 'projekt0n/github-nvim-theme', name = 'github-theme' },
  { 'rmehri01/onenord.nvim' },
  { 'shaunsingh/nord.nvim' },
  { 'NLKNguyen/papercolor-theme' },
  { 'rebelot/kanagawa.nvim' },
  { 'bluz71/vim-moonfly-colors', name = 'moonfly' },
  {
    'zenbones-theme/zenbones.nvim',
    config = function()
      vim.g.zenbones_darken_comments = 45
      vim.cmd.background = 'light'
    end,
  },
  {
    'marko-cerovac/material.nvim',
    config = function()
      require('material').setup({
        lualine_style = 'stealth',
        -- disable = { background = true },
        high_visibility = { darker = true },
      })
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
        vim.cmd.colors('nordfox')
      end,
      set_light_mode = function()
        vim.cmd.colors('season')
      end,
    },
  },
}

-- vim: ts=2 sts=2 sw=2 et
