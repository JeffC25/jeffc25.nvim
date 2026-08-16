local pack = require('pack')
pack.add({
  pack.gh('kawre/leetcode.nvim'),
  pack.gh('nvim-telescope/telescope.nvim'),
  pack.gh('nvim-lua/plenary.nvim'),
  pack.gh('MunifTanjim/nui.nvim'),
})

require('leetcode').setup({ lang = 'python' })

-- vim: ts=2 sts=2 sw=2 et
