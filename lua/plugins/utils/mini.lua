-- Collection of various small independent plugins/modules

local pack = require('pack')
pack.add({ pack.gh('echasnovski/mini.nvim') })
-- Better Around/Inside textobjects
--
-- Examples:
--  - va)  - [V]isually select [A]round [)]paren
--  - yinq - [Y]ank [I]nside [N]ext [Q]uote
--  - ci'  - [C]hange [I]nside [']quote
require('mini.ai').setup({ n_lines = 500 })

-- Add/delete/replace surroundings (brackets, quotes, etc.)
--
-- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
-- - sd'   - [S]urround [D]elete [']quotes
-- - sr)'  - [S]urround [R]eplace [)] [']
require('mini.surround').setup()

require('mini.splitjoin').setup({
  mappings = {
    toggle = '<Leader>fa',
    split = '',
    join = '',
  },
})

-- vim: ts=2 sts=2 sw=2 et
