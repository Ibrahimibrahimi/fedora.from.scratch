return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    lazy = false,
    opts = {
      size = 20,
      open_mapping = [[<F5>]],  -- changed from <C-\>
      direction = "float",        -- "float" | "horizontal" | "vertical"
      float_opts = {
        border = "curved",
      },
      shell = vim.o.shell,
    },
    config = function(_, opts)
      require("toggleterm").setup(opts)

      -- Lazygit shortcut inside toggleterm
      local Terminal = require("toggleterm.terminal").Terminal
      local lazygit = Terminal:new({ cmd = "lazygit", hidden = true, direction = "float" })

      vim.keymap.set("n", "<leader>gg", function() lazygit:toggle() end, { desc = "LazyGit" })
    end,
  },
}
