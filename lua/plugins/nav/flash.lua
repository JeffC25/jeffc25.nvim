return {
  "folke/flash.nvim",
  lazy = false, -- load immediately
  ---@type Flash.Config
  opts = {
    modes = {
      char = {
        enabled = false,  -- disable default char mode so f/F don't stop at 1 char
      },
      search = {
        enabled = true,   -- enable multi-character search
        jump_labels = true,
      },
    },
  },
  keys = {
    -- f = multi-char forward search
    {"f", mode = { "n", "x", "o" }, function() require("flash").jump({ search = { mode = "search" }, }) end, desc = "Flash search forward",},
    -- F = multi-char backward search
    {"F", mode = { "n", "x", "o" }, function() require("flash").jump({ search = { mode = "search", backward = true }, }) end, desc = "Flash search backward",},
    -- Remote flash (operator-pending)
    {"r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash",},
    {"R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search",},
    -- Toggle flash in command-line mode
    {"<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search",},
  },
}

