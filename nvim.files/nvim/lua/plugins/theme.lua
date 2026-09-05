return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  opts = {
    flavour = "mocha",       -- latte, frappe, macchiato, mocha
    integrations = {
      treesitter = true,
      native_lsp = {
        enabled = true,
      },
      telescope = { enabled = true },
      indent_blankline = { enabled = true },
      gitsigns = true,
    },
  },
  config = function(_, opts)
    require("catppuccin").setup(opts)
    vim.cmd("colorscheme catppuccin")
  end,
}
