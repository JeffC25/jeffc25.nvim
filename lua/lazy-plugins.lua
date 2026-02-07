-- Configure and install plugins

require('lazy').setup({
  require('plugins.utils.vim-sleuth'),

  require('plugins.debugger.debugger'),

  require('plugins.git.gitsigns'),
  require('plugins.git.vim-fugitive'),

  require('plugins.lang.go'),
  require('plugins.lang.rust'),
  require('plugins.lang.xcode'),

  require('plugins.lsp.autopairs'),
  require('plugins.lsp.blink'),
  require('plugins.lsp.conform'),
  require('plugins.lsp.lspconfig'),

  require('plugins.nav.flash'),
  require('plugins.nav.harpoon'),
  require('plugins.nav.neo-tree'),
  require('plugins.nav.oil'),

  require('plugins.telescope.telescope'),
  require('plugins.treesitter.treesitter'),

  require('plugins.ui.lualine'),
  require('plugins.ui.theme'),
  require('plugins.ui.todo-comments'),
  require('plugins.ui.icons'),
  require('plugins.ui.indent-guides'),
  require('plugins.ui.zen'),

  require('plugins.utils.mini'),
  require('plugins.utils.session'),
  require('plugins.utils.tmux'),
  require('plugins.utils.which-key'),

  -- require('plugins.nav.arrow'),
  -- require('plugins.lsp.cmp'),
  -- require('plugins.misc.leetcode'),
  -- require('plugins.utils.visual-multi'),
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
