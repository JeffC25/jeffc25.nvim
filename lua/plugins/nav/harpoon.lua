return {
  'ThePrimeagen/harpoon',
  config = function()
    local mark = require('harpoon.mark')
    local ui = require('harpoon.ui')

    vim.keymap.set('n', ';a', mark.add_file, { desc = "Harpoon [s]ave file"} )
    vim.keymap.set('n', ';d', mark.rm_file, { desc = "Harpoon [d]elete file"} )
    vim.keymap.set('n', ';;', ui.toggle_quick_menu, { desc = "Harpoon toggle "})

    vim.keymap.set('n', ';1', function() ui.nav_file(1) end, { desc = "Harpoon file 1" })
    vim.keymap.set('n', ';2', function() ui.nav_file(2) end, { desc = "Harpoon file 2" })
    vim.keymap.set('n', ';3', function() ui.nav_file(3) end, { desc = "Harpoon file 3" })
    vim.keymap.set('n', ';4', function() ui.nav_file(4) end, { desc = "Harpoon file 4" })
    vim.keymap.set('n', ';5', function() ui.nav_file(5) end, { desc = "Harpoon file 5" })
    vim.keymap.set('n', ';6', function() ui.nav_file(6) end, { desc = "Harpoon file 6" })
    vim.keymap.set('n', ';7', function() ui.nav_file(7) end, { desc = "Harpoon file 7" })
    vim.keymap.set('n', ';8', function() ui.nav_file(8) end, { desc = "Harpoon file 8" })
    vim.keymap.set('n', ';9', function() ui.nav_file(9) end, { desc = "Harpoon file 9" })

    vim.api.nvim_create_autocmd("FileType", {
      pattern = "harpoon",
      callback = function()
        for i = 1, 9 do
          vim.keymap.set("n", tostring(i), function()
            require("harpoon.ui").nav_file(i)
          end, { buffer = true, silent = true })
        end
      end,
    })
  end,
}
