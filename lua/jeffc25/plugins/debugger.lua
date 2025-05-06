return {
  'mfussenegger/nvim-dap',
  dependencies = {
    { 'rcarriga/nvim-dap-ui', commit = 'bc81f8d3440aede116f821114547a476b082b319' },
    { 'nvim-neotest/nvim-nio' },
  },
  config = function()
    local dap = require('dap')
    local dapui = require('dapui')

    dap.listeners.before.attach.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.launch.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated.dapui_config = function()
      dapui.close()
    end
    dap.listeners.before.event_exited.dapui_config = function()
      dapui.close()
    end

    vim.keymap.set('n', '<Leader>db', dap.toggle_breakpoint, { desc = 'Toggle debugger breakpoint' })
    vim.keymap.set('n', '<Leader>dc', dap.continue, { desc = 'Continue debugger' })
  end,
}
