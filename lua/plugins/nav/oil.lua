local pack = require('pack')
pack.add({
  pack.gh('refractalize/oil-git-status.nvim'),
  pack.gh('stevearc/oil.nvim'),
})

require('oil').setup({
  win_options = {
    signcolumn = 'yes:2',
  },
  skip_confirm_for_simple_edits = true,
})

-- Toggle parent directory
vim.keymap.set('n', '<leader>o', function()
  if vim.bo.filetype == 'oil' then
    vim.cmd('close')
  else
    vim.cmd('Oil --float --preview')
  end
end, { desc = 'Toggle Oil (parent dir)' })

-- Toggle project root
vim.keymap.set('n', '<leader>O', function()
  if vim.bo.filetype == 'oil' then
    vim.cmd('close')
  else
    vim.cmd('Oil . --float --preview')
  end
end, { desc = 'Toggle Oil (project root)' })
