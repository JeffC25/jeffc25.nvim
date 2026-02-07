vim.g.rustaceanvim = {
  -- Plugin configuration
  tools = {},
  -- LSP configuration
  server = {
    on_attach = function(client, bufnr)
      vim.keymap.set('n', '<leader>ee', function()
        vim.cmd.RustLsp('explainError', 'current')
      end, { desc = '[E]xplain [E]rror' })

      vim.keymap.set('n', '<leader>en', function()
        vim.cmd.RustLsp('explainError', 'cycle')
      end, { desc = '[E]xplain [Next] error' })

      vim.keymap.set('n', '<leader>ep', function()
        vim.cmd.RustLsp('explainError', 'cycle_prev')
      end, { desc = '[E]xplain [Previous] error' })

      vim.keymap.set('n', '<leader>dr', function()
        vim.cmd.RustLsp('debuggables')
      end, { desc = 'Rust Debuggables', buffer = bufnr })

      -- Supports rust-analyzer's grouping
      -- Keymap overrides vim.lsp.buf.codeAction() (no grouping)
      vim.keymap.set('n', '<leader>ca', function()
        vim.cmd.RustLsp('codeAction')
      end, { silent = true, buffer = bufnr })

      -- Override built-in hover keymap with rustaceanvim's hover actions
      vim.keymap.set('n', 'K', function()
        vim.cmd.RustLsp({ 'hover', 'actions' })
      end, { silent = true, buffer = bufnr })
    end,

    default_settings = {
      -- rust-analyzer language server configuration
      ['rust-analyzer'] = {},
    },
  },
  -- DAP configuration
  dap = {},
}

return {
  'mrcjkb/rustaceanvim',
  version = '^7', -- Recommended
  lazy = false, -- This plugin is already lazy
}

-- vim: ts=2 sts=2 sw=2 et
