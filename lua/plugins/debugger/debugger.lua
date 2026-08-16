local pack = require('pack')
pack.add({
  pack.gh('nvim-neotest/nvim-nio'),
  pack.gh('rcarriga/nvim-dap-ui'),
  pack.gh('mfussenegger/nvim-dap'),
})

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
