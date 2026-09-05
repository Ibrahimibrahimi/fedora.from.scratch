-- ~/.config/nvim/lua/plugins/zen.lua
return {
  "folke/snacks.nvim",
  keys = {
    { "<leader>z", function() Snacks.zen() end,        desc = "Toggle Zen Mode" },
    { "<leader>Z", function() Snacks.zen.zoom() end,   desc = "Toggle Zoom" },
  },
  opts = {
    zen = {
      -- window size when zen activates
      width = 120,          -- width of the zen window (columns)
      height = 0,           -- 0 = full height

      -- what to hide when zen activates
      backdrop = {
        transparent = true,
        blend = 40,         -- 0 = fully transparent, 100 = fully opaque
      },

      -- toggles when entering zen
      toggles = {
        dim        = true,  -- dim inactive windows
        git_signs  = false, -- hide gitsigns
        mini_diff  = false,
        diagnostics= false, -- hide LSP diagnostics (less noise)
        inlay_hints= false, -- hide inlay hints
      },

      -- UI elements to hide
      on_open = function(win)
        vim.opt.number         = false  -- hide line numbers
        vim.opt.relativenumber = false  -- hide relative numbers
        vim.opt.signcolumn     = "no"   -- hide sign column
        vim.opt.statusline     = ""     -- hide statusline
      end,

      -- restore UI when leaving zen
      on_close = function(win)
        vim.opt.number         = true
        vim.opt.relativenumber = true
        vim.opt.signcolumn     = "yes"
      end,
    },
  },
}
