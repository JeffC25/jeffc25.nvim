-- File Tree

local pack = require('pack')
pack.add({
  pack.gh('nvim-neo-tree/neo-tree.nvim'),
  pack.gh('nvim-lua/plenary.nvim'),
  pack.gh('MunifTanjim/nui.nvim'),
})

require('neo-tree').setup({
  filesystem = {
    hijack_netrw_behavior = 'disabled',
    window = {
      mappings = {
        ['\\'] = 'close_window',
      },
    },
    follow_current_file = {
      enabled = true,
    },
  },
})

vim.keymap.set('n', '\\', ':Neotree reveal<CR>', { desc = 'NeoTree reveal', silent = true })
vim.keymap.set('n', '<C-\\>', ':Neotree reveal<CR>', { desc = 'NeoTree reveal', silent = true })

-- Auto-close Neo-tree before exiting Neovim
vim.api.nvim_create_autocmd('VimLeavePre', {
  callback = function()
    vim.cmd('Neotree close')
  end,
})

-- vim: ts=2 sts=2 sw=2 et
