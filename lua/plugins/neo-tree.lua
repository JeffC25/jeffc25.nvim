-- File Tree

return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'MunifTanjim/nui.nvim',
  },
  cmd = 'Neotree',
  keys = {
    { '\\', ':Neotree reveal<CR>', desc = 'NeoTree reveal', silent = true },
    { '<C-\\>', ':Neotree reveal<CR>', desc = 'NeoTree reveal', silent = true },
  },
  opts = {
    filesystem = {
      window = {
        mappings = {
          ['\\'] = 'close_window',
        },
      },
    },
  },

  config = function(_, opts)
    require("neo-tree").setup(opts)

    -- Auto-close Neo-tree before exiting Neovim
    vim.api.nvim_create_autocmd("VimLeavePre", {
      callback = function()
        vim.cmd("Neotree close")
      end,
    })
  end,
}

-- vim: ts=2 sts=2 sw=2 et

