return {
  {
    "hedyhli/outline.nvim",
    cmd = { "Outline", "OutlineOpen" },
    keys = {
      { "<leader>o", "<cmd>Outline<cr>", desc = "Toggle Outline" },
    },
    opts = {
      outline_window = {
        width = 30,
        relative_width = false,
        auto_close = false,
      },
      symbols = {
        -- customize which symbols appear if you want
      },
    },
  },
}
