-- Configure and install plugins

require('lazy').setup({
  'tpope/vim-sleuth',

  require('plugins/tmux'),

  require('plugins/telescope'),

  require('plugins/treesitter'),

  require('plugins/git'),

  require('plugins/which-key'),

  require('plugins/lspconfig'),

  require('plugins/conform'),

  require('plugins/cmp'),

  require('plugins/autopairs'),

  require('plugins/theme'),

  require('plugins/neo-tree'),

  require('plugins/todo-comments'),

  require('plugins/mini'),

  require('plugins/lualine'),

  require('plugins/indent-guides'),

  require('plugins/oil'),

  require('plugins/session'),

  require('plugins/debugger'),

  -- require('plugins/arrow'),

  require('plugins/icons'),

  require('plugins/flash'),

  require('plugins/xcode'),

  -- require('plugins/ufo'),

  require('plugins/harpoon'),

  require('plugins/leetcode'),

  -- require('plugins/visual-multi'),
}, {
  ui = {
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
  install = {},
})

-- vim: ts=2 sts=2 sw=2 et
