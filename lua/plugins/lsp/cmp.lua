-- Autocompletion

local pack = require('pack')
pack.add({
  pack.gh('saadparwaiz1/cmp_luasnip'),
  pack.gh('hrsh7th/cmp-nvim-lsp'),
  pack.gh('hrsh7th/nvim-cmp'),
  pack.gh('hrsh7th/cmp-path'),
})

-- See `:help cmp`
local cmp = require('cmp')
local luasnip = require('luasnip')
luasnip.config.setup({})

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  completion = { completeopt = 'menu,menuone,noinsert' },

  -- See `:help ins-completion`
  mapping = cmp.mapping.preset.insert({
    -- ['<C-n>'] = cmp.mapping.select_next_item(),
    -- ['<C-p>'] = cmp.mapping.select_prev_item(),
    -- ['<C-y>'] = cmp.mapping.confirm({ select = true }),

    -- Scroll the documentation window [b]ack / [f]orward
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),

    -- NOTE: Traditional mappings
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ['<Tab>'] = cmp.mapping.select_next_item(),
    ['<S-Tab>'] = cmp.mapping.select_prev_item(),

    -- Manually trigger a completion from nvim-cmp.
    ['<C-Tab>'] = cmp.mapping.complete({}),

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

-- vim: ts=2 sts=2 sw=2 et
