-- Basic Keymaps
-- See `:help vim.keymap.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
-- See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in builtin terminal with shortcut (default: <C-\><C-n>)
-- NOTE: Won't work in all terminal emulators/tmux/etc.
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Use CTRL+<hjkl> to switch between windows
-- See `:help wincmd` for list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Basic Autocommands
-- See `:help lua-guide-autocommands`

-- Map CTRL + / to act like `gc` (toggle comments)
vim.api.nvim_set_keymap('n', '<C-/>', 'gcc', { noremap = false, silent = true })
vim.api.nvim_set_keymap('v', '<C-/>', 'gc', { noremap = false, silent = true })

-- Highlight when yanking (copying) text
-- See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Yank current buffer name
vim.keymap.set('n', '<leader>ya', '<cmd>let @+ = expand("%:p")<CR>', { desc = '[Y]ank [A]bsolute current buffer name'})
vim.keymap.set('n', '<leader>yr', '<cmd>let @+ = expand("%")<CR>', { desc = '[Y]ank [R]elative current buffer name'})
vim.keymap.set('n', '<leader>yb', '<cmd>let @+ = expand("%:t")<CR>', { desc = '[Y]ank current [B]uffer name'})

-- vim: ts=2 sts=2 sw=2 et
