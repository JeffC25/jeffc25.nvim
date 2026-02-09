-- LSP Plugins

return {
  {
    -- `lazydev` configures Lua LSP for Neovim config
    'folke/lazydev.nvim',
    ft = 'lua',
    opts = {
      library = {
        -- Load luvit types when the `vim.uv` word is found
        { path = 'luvit-meta/library', words = { 'vim%.uv' } },
      },
    },
  },
  { 'Bilal2453/luvit-meta', lazy = true },
  {
    -- Main LSP Configuration
    'neovim/nvim-lspconfig',
    priority = 1000,
    lazy = false,
    dependencies = {
      -- Automatically install LSPs and related tools to stdpath for Neovim
      -- Mason must be loaded before its dependents
      { 'mason-org/mason.nvim', opts = {} },
      'mason-org/mason-lspconfig.nvim',
      'WhoIsSethDaniel/mason-tool-installer.nvim',

      -- Status updates for LSP.
      {
        'j-hui/fidget.nvim',
        opts = {
          notification = {
            window = { winblend = 0, align = 'top', normal_hl = 'Function' },
          },
        },
      },
    },
    config = function()
      -- See `:help lsp-vs-treesitter`
      local virtual_text_enabled = true
      vim.diagnostic.config({ virtual_text = virtual_text_enabled })

      vim.lsp.inlay_hint.enable(false)

      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
        callback = function(event)
          -- Function to easily define mappings specific for LSP related items.
          -- It sets the mode, buffer and description for us each time.
          local map = function(keys, func, desc, mode)
            mode = mode or 'n'
            vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
          end

          -- Jump to definition.
          -- To jump back: <C-t>.
          map('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')

          -- Find references.
          map('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')

          -- Jump to implementation.
          --  Useful when your language has ways of declaring types without an actual implementation.
          map('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')

          -- Go to type.
          map('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')

          -- Fuzzy find all symbols in your current document (variables, functions, types, etc).
          map('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')

          -- Fuzzy find all the symbols in current workspace
          map('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

          -- Rename the variable under cursor.
          -- Most Language Servers support renaming across files, etc.
          map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')

          -- Execute a code action
          map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction', { 'n', 'x' })

          -- Go to declaration (not definition)
          map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

          -- Show diagnostics info for word under cursor
          map('<leader>dw', vim.diagnostic.open_float, '[D]iagnostics for current [W]ord')

          -- Show diagonstics info on same line
          map('<leader>td', function()
            virtual_text_enabled = not virtual_text_enabled
            vim.diagnostic.config({ virtual_text = virtual_text_enabled })
            print('Virtual Text ' .. (virtual_text_enabled and 'Enabled' or 'Disabled'))
          end, 'LSP: [T]oggle inline [D]iagnostics')

          -- Following two autocommands used to highlight references of the
          -- word under cursor (when cursor rests there for a little while).
          -- See `:help CursorHold`
          local client = vim.lsp.get_client_by_id(event.data.client_id)
          if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
            local highlight_augroup = vim.api.nvim_create_augroup('lsp-highlight', { clear = false })
            vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
              buffer = event.buf,
              group = highlight_augroup,
              callback = vim.lsp.buf.document_highlight,
            })

            -- When cursor is moved, highlights will be cleared.
            vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
              buffer = event.buf,
              group = highlight_augroup,
              callback = vim.lsp.buf.clear_references,
            })

            vim.api.nvim_create_autocmd('LspDetach', {
              group = vim.api.nvim_create_augroup('lsp-detach', { clear = true }),
              callback = function(event2)
                vim.lsp.buf.clear_references()
                vim.api.nvim_clear_autocmds({ group = 'lsp-highlight', buffer = event2.buf })
              end,
            })
          end

          -- The following code creates a keymap to toggle inlay hints (if supported by LSP)
          -- (Can displace some code)
          if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
            map('<leader>th', function()
              vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
            end, '[T]oggle Inlay [H]ints')
          end
        end,
      })

      -- Change diagnostic symbols in the sign column (gutter)
      if vim.g.have_nerd_font then
        local signs = { ERROR = '', WARN = '', INFO = '', HINT = '' }
        local diagnostic_signs = {}
        for type, icon in pairs(signs) do
          diagnostic_signs[vim.diagnostic.severity[type]] = icon
        end
        vim.diagnostic.config({ signs = { text = diagnostic_signs } })
      end

      -- Additional capabilities with nvim cmp, broadcast to LSP servers.
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      -- capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

      -- Enable additional  language servers
      --  Add any additional override configuration in the following tables. Available keys are:
      --  - cmd (table): Override the default command used to start the server
      --  - filetypes (table): Override the default list of associated filetypes for the server
      --  - capabilities (table): Override fields in capabilities. Can be used to disable certain LSP features.
      --  - settings (table): Override the default settings passed when initializing the server.
      --        Ex: to see the options for `lua_ls`, go to https://luals.github.io/wiki/settings/
      local servers = {
        clangd = {},
        gopls = {},
        pyright = {},
        rust_analyzer = {},
        ts_ls = {},
        tailwindcss = {},
        jsonls = {},
        zls = {
          settings = {
            zls = {
              {
                enable_build_on_save = true,
                build_on_save_step = 'check',
              },
            },
          },
        },
        lua_ls = {
          -- cmd = { ... },
          -- filetypes = { ... },
          -- capabilities = {},
          settings = {
            Lua = {
              completion = {
                callSnippet = 'Replace',
              },
              -- You can toggle below to ignore Lua_LS's noisy `missing-fields` warnings
              -- diagnostics = { disable = { 'missing-fields' } },
            },
          },
        },
      }

      -- Ensure the servers and tools above are installed
      --
      --`:Mason` to open Mason menu
      -- Press `g?` for help in Mason menu.
      --
      -- `mason` set up above: configure options in `dependencies` table for `nvim-lspconfig`.
      -- Add other tools here for Mason to install
      local ensure_installed = vim.tbl_keys(servers or {})
      vim.list_extend(ensure_installed, {
        'stylua', -- Used to format Lua code
      })
      require('mason-tool-installer').setup({ ensure_installed = ensure_installed })

      require('mason-lspconfig').setup({
        ensure_installed = { 'lua_ls' },
        automatic_installation = true,
        automatic_enable = true,
        handlers = {
          function(server_name)
            local server = servers[server_name] or {}
            -- This handles overriding only values explicitly passed
            -- by the server configuration above. Useful when disabling
            -- certain features of an LSP (Ex: turning off formatting for ts_ls)
            server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
            vim.lsp.config(server_name, server)
            vim.lsp.enable(server_name)
          end,
        },
      })

      -- non-Mason LSPs
      vim.lsp.config['sourcekit'] = {
        cmd = { 'sourcekit-lsp' },
        capabilities = capabilities,
        root_dir = vim.fs.root(0, { 'Package.swift', '.git', 'compile_commands.json', 'buildServer.json' }),
        filetypes = { 'swift', 'objective-c', 'objective-cpp' },
      }

      vim.api.nvim_create_autocmd('FileType', {
        pattern = { 'swift', 'objective-c', 'objective-cpp' },
        callback = function()
          vim.lsp.start(vim.lsp.config['sourcekit'])
        end,
      })
    end,
  }
}

-- vim: ts=2 sts=2 sw=2 et
