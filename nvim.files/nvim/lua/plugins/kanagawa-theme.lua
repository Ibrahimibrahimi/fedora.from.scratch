-- ~/.config/nvim/lua/plugins/theme.lua
return {
  "rebelot/kanagawa.nvim",
  priority = 1000,    -- load before everything else
  opts = {
    theme = "wave",   -- wave, dragon, lotus
    background = {
      dark  = "wave",
      light = "lotus",
    },
  },
  config = function(_, opts)
    require("kanagawa").setup(opts)
    vim.cmd("colorscheme kanagawa")
  end,
}
