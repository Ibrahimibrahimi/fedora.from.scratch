local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

ls.add_snippets("html", {
  -- Div with '.'
  s(".", {
    t('<div class="'),
    i(1, "mydiv"), -- class of div
    t('" >'),
    i(2, "Hi there"),
    t("</div>")
  }),
  s("btn",{
    t("<button>"),
    i(1,"Click me mommy"),
    t("</button>")
  }),
  -- Forms
  s("form",{
    t("<form action='"),
    i(1,"/"),
    t("' methode='"),
    i(2,"post"),
    t("'>"),
    i(3,"s"),
    t("</form>"),
  }),
  -- Easy form inputs 
  s("input:text",{
    t('<input type="text" name="'),
    i(1,'username'),
    t('">')
  }),
 s("password",{
    t('<input type="password" name="'),
    i(1,'password'),
    t('">')
  }),
 s("email",{
    t('<input type="email" name="'),
    i(1,'email'),
    t('">')
  }),
  s("!",{
  	t({
      "<!DOCTYPE html>",
      "<html>",
      "   <head>",
      "     <meta charset=\"utf-8\">",
      "     <link rel=\"StyleSheet\" href=\""
    }),
    i(2,"src/index.css"),
    t({
      "\" >",
      "   </head>",
      "   <body>",
      " "
    }),
    i(3,"     <p> replace me mommy </p>"),
    t({
      " ",
      "   </body>","</html>"
    })
  }),
  s("a",{
    t("<a href=\""),
    i(1,"#"),
    t("\" >"),
    i(2,"click me mommy"),
    t("</a>")
  }),
  s("br",{
    t("<br>")
  })
})
