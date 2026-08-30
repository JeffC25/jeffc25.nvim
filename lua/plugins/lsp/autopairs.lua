-- Autopairs

local pack = require('pack')
pack.add({ pack.gh('windwp/nvim-autopairs') })

local npairs = require('nvim-autopairs')
local Rule = require('nvim-autopairs.rule')

npairs.setup()

npairs.add_rule(Rule('<', '>'):with_pair(function(opts)
  local line = opts.line
  local col = opts.col
  return line:sub(col - 1, col - 1):match('[%w_]') ~= nil
end))

-- vim: ts=2 sts=2 sw=2 et
