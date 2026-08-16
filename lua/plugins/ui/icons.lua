local pack = require('pack')
pack.add({ pack.gh('nvim-tree/nvim-web-devicons') })

require('nvim-web-devicons').setup({
  rs = { icon = '', color = '#dea584', name = 'Rust' },
})

-- vim: ts=2 sts=2 sw=2 et
