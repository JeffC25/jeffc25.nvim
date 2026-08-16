-- Highlight, edit, and navigate code

local pack = require('pack')
pack.add({ { src = pack.gh('nvim-treesitter/nvim-treesitter'), version = 'main' } })

local ts = require('nvim-treesitter')

ts.install({
  'bash',
  'c',
  'diff',
  'html',
  'lua',
  'luadoc',
  'markdown',
  'markdown_inline',
  'query',
  'vim',
  'vimdoc',
  'go',
  'zig',
  'rust',
  'python'
})

vim.api.nvim_create_autocmd('FileType', {
  group = vim.api.nvim_create_augroup('treesitter-highlight', { clear = true }),
  callback = function(args)
    pcall(vim.treesitter.start, args.buf)
  end,
})

-- vim: ts=2 sts=2 sw=2 et
