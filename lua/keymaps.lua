-- Basic Keymaps
-- See `:help vim.keymap.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
-- See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', function()
  local winid = vim.fn.getloclist(0, { winid = 0 }).winid
  -- loclist not open → populate + open
  if winid == 0 then
    vim.diagnostic.setloclist()
  else
    -- already in loclist → close it
    if vim.fn.win_getid() == winid then
      vim.cmd('lclose')
      -- loclist is open but not focused → jump there
    else
      vim.cmd('lopen')
      vim.api.nvim_set_current_win(winid)
    end
  end
end, { desc = 'Toggle/navigate diagnostic [Q]uickfix list' })

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'qf', -- both quickfix and loclist use this filetype
  callback = function(event)
    vim.keymap.set('n', 'q', '<cmd>lclose<CR>', {
      buffer = event.buf,
      silent = true,
    })
  end,
})

-- Exit terminal mode in builtin terminal with shortcut (default: <C-\><C-n>)
-- NOTE: Won't work in all terminal emulators/tmux/etc.
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Use CTRL+<hjkl> to switch between windows
-- See `:help wincmd` for list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w>h', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w>l', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w>j', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w>k', { desc = 'Move focus to the upper window' })

-- Resizing windows
vim.keymap.set('n', '<A-Left>',  '<C-w><')
vim.keymap.set('n', '<A-Right>', '<C-w>>')
vim.keymap.set('n', '<A-Up>',    '<C-w>+')
vim.keymap.set('n', '<A-Down>',  '<C-w>-')

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
vim.keymap.set('n', '<leader>ya', '<cmd>let @+ = expand("%:p")<CR>', { desc = '[Y]ank [A]bsolute current buffer name' })
vim.keymap.set('n', '<leader>yr', '<cmd>let @+ = expand("%")<CR>', { desc = '[Y]ank [R]elative current buffer name' })
vim.keymap.set('n', '<leader>yb', '<cmd>let @+ = expand("%:t")<CR>', { desc = '[Y]ank current [B]uffer name' })

-- Tab navigation
vim.keymap.set('n', '<Leader>tn', ':tabnext<CR>', { noremap = true, silent = true, desc = 'Move focus to the next tab' })
vim.keymap.set('n', '<Leader>tp', ':tabprev<CR>', { noremap = true, silent = true, desc = 'Move focus to the previous tab' })
vim.keymap.set('n', '<Leader>tf', ':tabfirst<CR>', { noremap = true, silent = true, desc = 'Move focus to the first tab' })
vim.keymap.set('n', '<Leader>tl', ':tablast<CR>', { noremap = true, silent = true, desc = 'Move focus to the last tab' })
vim.keymap.set('n', '<Leader>tw', ':tabclose<CR>', { noremap = true, silent = true, desc = 'Close the current tab' })
vim.keymap.set('n', '<Leader>tN', ':tabnew<CR>', { noremap = true, silent = true, desc = 'Create a new tab' })
for i = 1, 9 do
  vim.keymap.set('n', '<Leader>t' .. i, ':tabn ' .. i .. '<CR>', { noremap = true, silent = true, desc = 'Move focus to tab' .. i })
  vim.keymap.set('n', 'C-' .. i, ':tabn ' .. i .. '<CR>', { noremap = true, silent = true, desc = 'Move focus to tab' .. i })
end

-- Go to the previous window
vim.api.nvim_set_keymap('n', '<S-Tab>', '<C-w><C-p>', { noremap = true, silent = true, desc = 'Move focus to the previous window' })

-- vim: ts=2 sts=2 sw=2 et
