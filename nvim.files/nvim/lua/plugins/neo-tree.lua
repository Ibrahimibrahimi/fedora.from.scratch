-- NOTE: can be toggleded with Ctrl + B 
return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  keys = {
    { "<C-b>", "<cmd>Neotree toggle<cr>", desc = "Toggle Explorer" },
  },
  opts = {
    filesystem = {
      filtered_items = {
        hide_dotfiles   = false,
        hide_gitignored = false,
      },
      follow_current_file = { enabled = true },
    },
    window = {
      position = "left",
      width    = 30,
    },
  },
}
