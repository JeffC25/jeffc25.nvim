-- Autocompletion

return {
  {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
      -- Snippet Engine & associated nvim-cmp source
      {
        'L3MON4D3/LuaSnip',
        build = (function()
          -- Build Step is needed for regex support in snippets.
          if vim.fn.has('win32') == 1 or vim.fn.executable('make') == 0 then
            return
          end
          return 'make install_jsregexp'
        end)(),
        dependencies = {
          -- `friendly-snippets` contains a variety of premade snippets.
          --    See the README about individual language/framework/plugin snippets:
          --    https://github.com/rafamadriz/friendly-snippets
          -- {
          --   'rafamadriz/friendly-snippets',
          --   config = function()
          --     require('luasnip.loaders.from_vscode').lazy_load()
          --   end,
          -- },
        },
      },
      'saadparwaiz1/cmp_luasnip',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
    },
    config = function()
      -- See `:help cmp`
      local cmp = require('cmp')
      local luasnip = require('luasnip')
      luasnip.config.setup({})

      -- -- NOTE: For traditional autocmp mappings
      -- Define a variable to toggle cmp
      -- vim.g.cmp_enabled = true

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },

        -- -- NOTE: For traditional autocmp mappings
        -- enabled = function()
        --   return vim.g.cmp_enabled
        -- end,
        -- vim.api.nvim_create_autocmd('InsertCharPre', {
        --   pattern = '*',
        --   callback = function()
        --     vim.g.cmp_enabled = true
        --   end,
        -- }),

        completion = { completeopt = 'menu,menuone,noinsert' },

        -- See `:help ins-completion`
        mapping = cmp.mapping.preset.insert({
          ['<C-n>'] = cmp.mapping.select_next_item(),
          ['<C-p>'] = cmp.mapping.select_prev_item(),
          ['<C-y>'] = cmp.mapping.confirm({ select = true }),

          -- Scroll the documentation window [b]ack / [f]orward
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),

          -- -- NOTE: Traditional mappings
          -- -- Backspace mapping to abort if suggestions are visible, otherwise normal backspace
          -- ['<BS>'] = cmp.mapping(function(fallback)
          --   if cmp.visible() then
          --     -- Abort completion if suggestions are visible
          --     cmp.abort()
          --   elseif not cmp.visible() then
          --     -- Disable nvim-cmp if there are no suggestions
          --     vim.g.cmp_enabled = false
          --     fallback() -- Continue normal backspace behavior
          --   end
          -- end, { 'i', 's' }),
          -- ['<CR>'] = cmp.mapping.confirm { select = true },
          -- ['<Tab>'] = cmp.mapping.select_next_item(),
          -- ['<S-Tab>'] = cmp.mapping.select_prev_item(),

          -- Manually trigger a completion from nvim-cmp.
          ['<C-Space>'] = cmp.mapping.complete({}),

          -- Snippet navigation
          ['<C-l>'] = cmp.mapping(function()
            if luasnip.expand_or_locally_jumpable() then
              luasnip.expand_or_jump()
            end
          end, { 'i', 's' }),
          ['<C-h>'] = cmp.mapping(function()
            if luasnip.locally_jumpable(-1) then
              luasnip.jump(-1)
            end
          end, { 'i', 's' }),

          -- See: https://github.com/L3MON4D3/LuaSnip?tab=readme-ov-file#keymaps
        }),
        sources = {
          {
            name = 'lazydev',
            -- set group index to 0 to skip loading LuaLS completions as lazydev recommends it
            group_index = 0,
          },
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
          { name = 'path' },
        },
      })
    end,
  },
}

-- vim: ts=2 sts=2 sw=2 et
