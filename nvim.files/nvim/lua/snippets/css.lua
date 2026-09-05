local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

ls.add_snippets("css", {
  -- main block
  s("pad",{
    t("padding : "),
    i(1,"2"),
    t("px;"),
    i(2,"\n")
  }),
  s("bg",{
    t("background : "),
    i(1,"#222121"),
    t(";");
    i(2,"\n")
  }),

})

