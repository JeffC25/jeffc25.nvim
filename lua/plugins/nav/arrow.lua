local pack = require('pack')
pack.add({ pack.gh('otavioschwanck/arrow.nvim') })

require('arrow').setup({
  show_icons = true,
  leader_key = ';', -- Recommended to be a single key
  buffer_leader_key = 'M', -- Per Buffer Mappings
  hide_buffer_handbook = true,
  style = 'auto',
  window = {
    border = 'rounded',
  },
})

-- vim: ts=2 sts=2 sw=2 et
