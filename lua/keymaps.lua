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

-- Tab navigation
vim.keymap.set('n', '<Leader>tn', ':tabnext<CR>', { noremap = true, silent = true, desc = 'Move focus to the next tab' }) -- Next tab
vim.keymap.set('n', '<Leader>tp', ':tabprev<CR>', { noremap = true, silent = true, desc = 'Move focus to the previous tab' }) -- Previous tab
vim.keymap.set('n', '<Leader>tf', ':tabfirst<CR>', { noremap = true, silent = true, desc = 'Move focus to the first tab' }) -- First tab
vim.keymap.set('n', '<Leader>tl', ':tablast<CR>', { noremap = true, silent = true, desc = 'Move focus to the last tab' }) -- Last tab
vim.keymap.set('n', '<Leader>tw', ':tabclose<CR>', { noremap = true, silent = true, desc = 'Close the current tab' }) -- Close current tab
vim.keymap.set('n', '<Leader>tN', ':tabnew<CR>', { noremap = true, silent = true, desc = 'Create a new tab' }) -- Close current tab
for i = 1, 9 do
  vim.keymap.set('n', '<Leader>t' .. i, ':tabn ' .. i .. '<CR>', { noremap = true, silent = true, desc = 'Move focus to tab' .. i }) -- Tab #i
end

-- vim: ts=2 sts=2 sw=2 et
