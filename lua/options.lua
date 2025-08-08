-- Setting options
-- See `:help vim.opt` and `:help option-list`

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- vim.g.have_nerd_font = true

-- Line numbers and relative line numbers
vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.mouse = 'a'

-- Mode already in status line
vim.opt.showmode = false

-- Sync clipboard between OS and Neovim.
-- Schedule the setting after `UiEnter` because it can increase startup-time.
-- See `:help 'clipboard'`
vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)

vim.opt.breakindent = true
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Signcolumn on by default
vim.opt.signcolumn = 'yes'

-- Decrease update time, mapped sequence wait time
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
-- See `:help 'list'` and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live
vim.opt.inccommand = 'split'

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10

-- Update directory when launching
vim.api.nvim_create_autocmd('VimEnter', {
  callback = function()
    local arg = vim.fn.argv(0)
    if arg then
      local arg_str = type(arg) == 'table' and arg[1] or arg
      if type(arg_str) == 'string' then
        local actual_path
        if string.match(arg_str, '^oil://') then
          actual_path = string.gsub(arg_str, '^oil://', '')
        else
          actual_path = arg_str
        end

        if actual_path and vim.fn.isdirectory(actual_path) == 1 then
          vim.cmd('cd ' .. vim.fn.fnameescape(actual_path))
        end
      end
    end
  end,
})

-- vim: ts=2 sts=2 sw=2 et
