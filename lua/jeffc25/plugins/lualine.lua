return {
  'nvim-lualine/lualine.nvim',
  config = function()
    local function macro_recording()
      local reg = vim.fn.reg_recording()
      if reg == '' then
        return ''
      end
      return '  @' .. reg
    end

    -- vim.api.nvim_create_autocmd('RecordingEnter', {
    --   callback = function()
    --     require('lualine').refresh()
    --   end,
    -- })
    --
    -- vim.api.nvim_create_autocmd('RecordingLeave', {
    --   callback = function()
    --     require('lualine').refresh()
    --   end,
    -- })

    vim.opt.showcmd = false
    vim.opt.cmdheight = 0
    vim.opt.ruler = false
    require('lualine').setup({
      options = {
        icons_enabled = true,
        theme = 'auto',
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
        disabled_filetypes = {
          statusline = {},
          winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        always_show_tabline = true,
        globalstatus = false,
        refresh = {
          statusline = 100,
          tabline = 100,
          winbar = 100,
        },
      },
      sections = {
        lualine_a = {
          {
            'mode',
            fmt = function(mode)
              if mode == 'COMMAND' then
                return 'CMD'
              end
              return string.sub(mode, 1, 3)
            end,
          },
        },
        lualine_b = {
          macro_recording,
          'searchcount'
        },
        lualine_c = {
          {
            'filename',
            path = 1,
            shorting_target = 40,
            symbols = {
              modified = '[+]',
              readonly = '',
              unnamed = '[No Name]',
            },
          },
          { 'diagnostics' },
        },
        lualine_x = {
          { 'diff', colored = true },
          { 'encoding' },
          { 'location' },
          {
            'filetype',
            icon_only = true,
          },
        },
        lualine_y = {},
        lualine_z = {},
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {
          {
            'filename',
            path = 1,
            shorting_target = 40,
            symbols = {
              modified = '[+]',
              readonly = '',
              unnamed = '[Unnamed]',
            },
          },
        },
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
      },
      tabline = {},
      winbar = {},
      inactive_winbar = {},
      extensions = {},
    })
  end,
}
