-- ~/.config/nvim/lua/plugins/bufferline.lua
return {
  "akinsho/bufferline.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  keys = {
    { "<S-l>",      "<cmd>BufferLineNext<cr>",     desc = "Next Buffer" },
    { "<S-h>",      "<cmd>BufferLinePrev<cr>",     desc = "Prev Buffer" },
    { "<leader>bd", "<cmd>bd<cr>",                 desc = "Close Buffer" },
    { "<leader>bp", "<cmd>BufferLineTogglePin<cr>", desc = "Pin Buffer" },
  },
  opts = {
    options = {
      diagnostics       = "nvim_lsp",        -- shows error count on the tab
      separator_style   = "slant",           -- slant, slope, thick, thin
      show_buffer_close_icons = true,
      show_close_icon   = false,
      color_icons       = true,
      offsets = {
        {
          filetype  = "neo-tree",
          text      = "Explorer",
          highlight = "Directory",
          separator = true,            -- separator between neo-tree and buffers
        },
      },
    },
  },
}
