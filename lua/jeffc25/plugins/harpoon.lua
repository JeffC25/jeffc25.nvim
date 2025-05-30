return {
  'ThePrimeagen/harpoon',
  config = function()
    local mark = require('harpoon.mark')
    local ui = require('harpoon.ui')

    vim.keymap.set('n', '<leader>a', mark.add_file, { desc = "Harpoon [a]dd"} )
    vim.keymap.set('n', '<leader>hh', ui.toggle_quick_menu, { desc = "Harpoon toggle "})

    vim.keymap.set('n', '<leader>ha', function() ui.nav_file(1) end, { desc = "Harpoon to file 1" })
    vim.keymap.set('n', '<leader>hs', function() ui.nav_file(2) end, { desc = "Harpoon to file 2" })
    vim.keymap.set('n', '<leader>hd', function() ui.nav_file(3) end, { desc = "Harpoon to file 3" })
    vim.keymap.set('n', '<leader>hf', function() ui.nav_file(4) end, { desc = "Harpoon to file 4" })

  end,
}
