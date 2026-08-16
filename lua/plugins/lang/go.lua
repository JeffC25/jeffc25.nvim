local pack = require('pack')
pack.add({
  pack.gh('ray-x/go.nvim'),
  pack.gh('ray-x/guihua.lua'),
  pack.gh('neovim/nvim-lspconfig'),
  pack.gh('nvim-treesitter/nvim-treesitter'),
})

require('go').setup({
  -- ISSUE: default options enabling inlay hints on save (for non-go files)
  lsp_inlay_hints = {
    enable = false,
  },
})

local format_sync_grp = vim.api.nvim_create_augroup('GoFormat', {})
vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = '*.go',
  callback = function()
    require('go.format').goimports()
  end,
  group = format_sync_grp,
})
