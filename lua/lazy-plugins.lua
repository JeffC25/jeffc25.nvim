-- Configure and install plugins

require('lazy').setup({
  'tpope/vim-sleuth',

  require('jeffc25/plugins/telescope'),

  require('jeffc25/plugins/treesitter'),

  require('jeffc25/plugins/git'),

  require('jeffc25/plugins/which-key'),

  require('jeffc25/plugins/lspconfig'),

  require('jeffc25/plugins/conform'),

  require('jeffc25/plugins/cmp'),

  require('jeffc25/plugins/autopairs'),

  require('jeffc25/plugins/autotag'),

  require('jeffc25/plugins/theme'),

  require('jeffc25/plugins/neo-tree'),

  require('jeffc25/plugins/todo-comments'),

  require('jeffc25/plugins/mini'),

  require('jeffc25/plugins/lualine'),

  require('jeffc25/plugins/indent-guides'),

  require('jeffc25/plugins/oil'),

  require('jeffc25/plugins/session'),

  require('jeffc25/plugins/debugger'),

  require('jeffc25/plugins/arrow'),

  require('jeffc25/plugins/icons'),

  require('jeffc25/plugins/xcode'),

  -- require('jeffc25/plugins/harpoon'),

  -- require('jeffc25/plugins/leetcode'),

  -- require('jeffc25/plugins/visual-multi'),
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
