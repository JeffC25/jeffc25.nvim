local pack = require('pack')
pack.add({
  pack.gh('MunifTanjim/nui.nvim'),
  pack.gh('stevearc/oil.nvim'),
  pack.gh('nvim-treesitter/nvim-treesitter'),
  pack.gh('wojciech-kulik/xcodebuild.nvim'),
})

require('xcodebuild').setup({})

-- vim: ts=2 sts=2 sw=2 et
