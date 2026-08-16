-- Autoformat

local pack = require('pack')
pack.add({ pack.gh('stevearc/conform.nvim') })

require('conform').setup({
  notify_on_error = false,
  formatters_by_ft = {
    lua = { 'stylua' },
    python = {
      'isort',
      -- 'black'
    },
    javascript = { 'prettier', stop_after_first = true },
    javascriptreact = { 'prettier' },
    typescript = { 'prettier' },
    typescriptreact = { 'prettier' },
    vue = { 'prettier' },
    css = { 'prettier' },
    scss = { 'prettier' },
    html = { 'prettier' },
    less = { 'prettier' },
    jsonc = { 'prettier' },
    yaml = { 'prettier' },
    markdown = { 'prettier' },
    ['markdown.mdx'] = { 'prettier' },
    graphql = { 'prettier' },
    handlebars = { 'prettier' },
    json = { 'fixjson', 'prettier' },
    xml = { 'xmlformatter' },
    go = { 'gofumpt', 'goimports' },
    sql = { 'sql_formatter' },
  },
})

vim.keymap.set('', '<leader>fm', function()
  require('conform').format({ async = true, lsp_format = 'fallback' })
end, { desc = '[F]ormat buffer' })

-- vim: ts=2 sts=2 sw=2 et
