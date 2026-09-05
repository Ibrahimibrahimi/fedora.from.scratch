local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

ls.add_snippets("python", {
  -- main block
  s("main", {
    t("if __name__ == '__main__':"),
    t({ "", "    " }),
    i(1, "pass"),
  }),
  -- NOTE: i added those  
  s("flaskapp",{
    t("from flask import Flask"),
    t({"","",""}),
    t("app = Flask(__name__)"),
    t({"","",""}),
    t("app.run(debug=True,host="),
    i(1,"0.0.0.0"),
    t(",port="),
    i(2,"1942"),
    t(")")
  }),
  -- Easy route
  s("flaskroute",{
    t("@"),
    i(1,"app"),
    t('.route("/'),
    i(2,"route_name"),
    t('")'),
    t({"",""}),
    t("def "),
    i(3,"route_function_name"),
    t("():"),
    t({"",""}),
    i(4," pass")
  }),
  -- Easy blueprint
  s("blueprint",{
    t("from flask import Blueprint"),
    t({"","",""}),
    i(1,"main_bp"),
    t("= Blueprint('"),
    i(2,"main"),
    t("',"),
    i(3,"__name__"),
    t(")"),
    t({"","",""})
  })
  ,
  -- print
  s("pp", {
    t("print("),
    i(1),
    t(")"),
  }),

  -- function
  s("def", {
    t("def "),
    i(1, "function_name"),
    t("("),
    i(2),
    t({ "):", "    " }),
    i(3, "pass"),
  }),

  -- class
  s("class", {
    t("class "),
    i(1, "ClassName"),
    t({ ":", "    def __init__(self):", "        " }),
    i(2, "pass"),
  }),


})
