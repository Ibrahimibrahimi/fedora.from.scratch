return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  event = "BufReadPost",    -- load as soon as you open a file
  opts = {
    indent = { char = "|" },
    scope = { enabled = true },
  },
}
