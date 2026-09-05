-- ~/.config/nvim/lua/plugins/drop.lua
return {
  "folke/drop.nvim",
  event = "VimEnter",
  opts = {
    theme = "auto",       -- auto picks based on current date/season
    max = 75,             -- max number of drops on screen
    interval = 100,       -- update every 100ms
    screensaver = 1000 * 60 * 5,  -- activate after 5 min idle (false to disable)
    filetypes = { "dashboard", "alpha", "ministarter" },
    winblend = 100,
  },
}
