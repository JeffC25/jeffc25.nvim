local pack = require('pack')
pack.add({ pack.gh('folke/flash.nvim') })

require('flash').setup({
  modes = {
    char = {
      enabled = false, -- disable default char mode so f/F don't stop at 1 char
    },
    search = {
      enabled = true, -- enable multi-character search
      jump_labels = true,
    },
  },
})
-- f = multi-char forward search
vim.keymap.set({ 'n', 'x', 'o' }, 'f', function()
  require('flash').jump({ search = { mode = 'search' } })
end, { desc = 'Flash search forward' })

-- F = multi-char backward search
vim.keymap.set({ 'n', 'x', 'o' }, 'F', function()
  require('flash').jump({ search = { mode = 'search', backward = true } })
end, { desc = 'Flash search backward' })

-- Remote flash (operator-pending)
vim.keymap.set('o', 'r', function()
  require('flash').remote()
end, { desc = 'Remote Flash' })
vim.keymap.set({ 'o', 'x' }, 'R', function()
  require('flash').treesitter_search()
end, { desc = 'Treesitter Search' })

-- Toggle flash in command-line mode
vim.keymap.set('c', '<c-s>', function()
  require('flash').toggle()
end, { desc = 'Toggle Flash Search' })

-- vim: ts=2 sts=2 sw=2 et
