return {
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    opts = {
      notify = { -- NOTE: i added this myself
        view = "notify",
      },
      lsp = {
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },

      },
      presets = {
        bottom_search = true,        -- classic bottom cmdline for search
        command_palette = true,      -- position cmdline + popupmenu together
        long_message_to_split = true,
        inc_rename = false,
        lsp_doc_border = true,       -- border around LSP hover docs
      },
    },
  },
}
