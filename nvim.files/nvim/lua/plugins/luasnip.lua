return {
  {
    "L3MON4D3/LuaSnip",
    config = function()
      -- load custom snippets
      require("snippets.python")
      -- add more languages:
      require("snippets.html") -- NOTE: i added this
      require("snippets.css")
      -- require("snippets.cpp")
    end,
  },
}
