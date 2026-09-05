return {
  "L3MON4D3/LuaSnip",
  dependencies = { "rafamadriz/friendly-snippets" },
  config = function()
    require("luasnip.loaders.from_vscode").lazy_load()

    -- optional: add React snippets to JS/TS
    require("luasnip").filetype_extend("javascript", { "react" })
    require("luasnip").filetype_extend("typescript", { "react" })
  end,
}
