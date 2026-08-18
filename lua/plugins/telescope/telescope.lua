-- Fuzzy Finder (files, lsp, etc)

local pack = require('pack')
pack.add({
  pack.gh('nvim-lua/plenary.nvim'),
  pack.gh('smartpde/telescope-recent-files'),
  pack.gh('nvim-telescope/telescope-fzf-native.nvim'),
  pack.gh('nvim-telescope/telescope-ui-select.nvim'),
  pack.gh('nvim-telescope/telescope-file-browser.nvim'),
  pack.gh('nvim-telescope/telescope.nvim'),
})

local actions = require('telescope.actions')
local layout_actions = require('telescope.actions.layout')
require('telescope').setup({
  defaults = {
    path_display = { 'truncate' },
    mappings = {
      i = {
        ['<C-Enter>'] = 'to_fuzzy_refine',
        ['<C-h>'] = 'which_key',
        ['<C-d>'] = actions.delete_buffer,
        ['<C-e>'] = actions.preview_scrolling_down,
        ['<C-y>'] = actions.preview_scrolling_up,
      },
      n = {
        ['<C-d>'] = actions.delete_buffer,
        ['<C-e>'] = actions.preview_scrolling_down,
        ['<C-y>'] = actions.preview_scrolling_up,
        ['T'] = layout_actions.cycle_layout_next,
      },
    },
  },
})

vim.cmd.autocmd('User TelescopePreviewerLoaded setlocal number')

-- Enable Telescope extensions if they are installed
pcall(require('telescope').load_extension, 'fzf')
pcall(require('telescope').load_extension, 'ui-select')

-- See `:help telescope.builtin`
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })

-- Object Search
vim.keymap.set('n', '<leader>so', function()
  builtin.lsp_dynamic_workspace_symbols({ previewer = true })
end, { desc = '[S]earch LSP [O]bjects (symbols)' })
vim.keymap.set('n', '<leader>sO', function()
  local kinds = { 'all', 'function', 'method', 'class', 'struct', 'interfact', 'enum', 'constant', 'variable' }
  vim.ui.select(kinds, { prompt = 'Symbol kind:' }, function(choice)
    if not choice then
      return
    end
    local opts = { previewer = true }
    if choice ~= 'all' then
      opts.symbols = choice
    end
    builtin.lsp_dynamic_workspace_symbols(opts)
  end)
end, { desc = '[S]earch LSP [O]bjects (pick kind)' })

-- File Search
vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sF', function()
  builtin.find_files({ hidden = true, prompt_title = 'Search Files (All)' })
end, { desc = '[S]earch All [F]iles' })

-- Grep Search
vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sG', function()
  builtin.live_grep({ hidden = true, prompt_title = 'Live Grep (All)' })
end, { desc = '[S]earch All by [G]rep' })
vim.keymap.set('n', '<leader>sl', function()
  builtin.live_grep({
    additional_args = { '--fixed-strings' },
    prompt_title = 'Live Grep (Literal)',
  })
end, { desc = '[S]earch [L]iteral' })
vim.keymap.set('n', '<leader>sL', function()
  builtin.live_grep({
    additional_args = { '--fixed-strings' },
    prompt_title = 'Live Grep (Literal, All)',
  })
end, { desc = '[S]earch All [L]iteral' })

vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
vim.keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
vim.api.nvim_set_keymap(
  'n',
  '<leader>sR',
  [[<cmd>lua require('telescope').extensions.recent_files.pick()<CR>]],
  { noremap = true, silent = true, desc = '[S]earch Recent Files (smart)' }
)
vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find existing buffers' })

vim.keymap.set('n', '<leader>/', function()
  builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown({
    winblend = 10,
    previewer = false,
  }))
end, { desc = '[/] Fuzzily search in current buffer' })

vim.keymap.set('n', '<space>fb', ':Telescope file_browser<CR>')
vim.keymap.set('n', '<space>ff', ':Telescope file_browser path=%:p:h select_buffer=true<CR>')

-- See `:help telescope.builtin.live_grep()`
vim.keymap.set('n', '<leader>s/', function()
  builtin.live_grep({
    grep_open_files = true,
    prompt_title = 'Live Grep in Open Files',
  })
end, { desc = '[S]earch [/] in Open Files' })

-- Shortcut for searching Neovim config files
vim.keymap.set('n', '<leader>sn', function()
  builtin.find_files({ cwd = vim.fn.stdpath('config') })
end, { desc = '[S]earch [N]eovim files' })

require('telescope').load_extension('file_browser')

-- vim: ts=2 sts=2 sw=2 et
