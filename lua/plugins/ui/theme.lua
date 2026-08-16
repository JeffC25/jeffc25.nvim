local pack = require('pack')
pack.add({
  -- Themes
  pack.gh('JeffC25/season.nvim'),
  pack.gh('folke/tokyonight.nvim'),
  pack.gh('EdenEast/nightfox.nvim'),
  pack.gh('Shatur/neovim-ayu'),
  pack.gh('rose-pine/neovim'),
  pack.gh('navarasu/onedark.nvim'),
  pack.gh('kepano/flexoki-neovim'),
  pack.gh('neanias/everforest-nvim'),
  pack.gh('catppuccin/nvim'),
  pack.gh('ellisonleao/gruvbox.nvim'),
  pack.gh('loctvl842/monokai-pro.nvim'),
  pack.gh('projekt0n/github-nvim-theme'),
  pack.gh('rmehri01/onenord.nvim'),
  pack.gh('shaunsingh/nord.nvim'),
  pack.gh('NLKNguyen/papercolor-theme'),
  pack.gh('rebelot/kanagawa.nvim'),
  pack.gh('bluz71/vim-moonfly-colors'),
  pack.gh('sainnhe/sonokai'),
  pack.gh('marko-cerovac/material.nvim'),
  pack.gh('maxmx03/solarized.nvim'),

  -- Other Dependencies
  pack.gh('catgoose/nvim-colorizer.lua'),
  pack.gh('f-person/auto-dark-mode.nvim'),
})

-- Per-theme configuration
require('material').setup({ lualine_style = 'stealth', disable = { background = true }, high_visibility = { darker = true } })

-- Auto switch theme
require('auto-dark-mode').setup({
  set_dark_mode = function()
    vim.cmd.colors('sonokai')
  end,
  set_light_mode = function()
    vim.cmd.colors('ayu-light')
  end,
})

-- Other configuation
require('colorizer').setup({ user_default_options = { names = false } })

-- vim: ts=2 sts=2 sw=2 et
