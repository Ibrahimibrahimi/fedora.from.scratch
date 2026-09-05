return {
  {
    "NvChad/nvim-colorizer.lua",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      user_default_options = {
        RGB      = true,   -- #RGB
        RRGGBB   = true,   -- #RRGGBB
        names    = false,  -- "blue" etc
        css      = true,   -- css variables
        tailwind = true,   -- tailwind colors
        mode     = "background",  -- "background"|"foreground"|"virtualtext"
      },
    },
  },
}
