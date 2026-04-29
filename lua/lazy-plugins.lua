-- Configure and install plugins

require('lazy').setup({
  -- Debugger plugins
  require('plugins.debugger.debugger'),

  -- Git plugins
  require('plugins.git.gitsigns'),
  require('plugins.git.vim-fugitive'),

  -- Language/Platform/Framework-specific Plugins
  require('plugins.lang.go'),
  require('plugins.lang.rust'),
  require('plugins.lang.xcode'),

  -- LSP plugins
  require('plugins.lsp.autopairs'),
  require('plugins.lsp.blink'),
  require('plugins.lsp.conform'),
  require('plugins.lsp.lspconfig'),

  -- Navigation plugins
  require('plugins.nav.harpoon'),
  require('plugins.nav.neo-tree'),
  require('plugins.nav.oil'),

  -- Telescope
  require('plugins.telescope.telescope'),

  -- Treesitter
  require('plugins.treesitter.treesitter'),

  -- UI Plugins
  require('plugins.ui.lualine'),
  require('plugins.ui.theme'),
  require('plugins.ui.todo-comments'),
  require('plugins.ui.icons'),
  require('plugins.ui.indent-guides'),
  require('plugins.ui.twilight'),
  require('plugins.ui.zen'),

  -- Misc.
  require('plugins.utils.mini'),
  require('plugins.utils.session'),
  require('plugins.utils.tmux'),
  require('plugins.utils.which-key'),
  require('plugins.utils.vim-sleuth'),

  -- require('plugins.nav.flash'),
  -- require('plugins.nav.arrow'),
  -- require('plugins.lsp.cmp'),
  -- require('plugins.misc.leetcode'),
  -- require('plugins.utils.kitty'),
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
