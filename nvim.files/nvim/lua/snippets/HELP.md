# How to add new snippet

## 1. create snippet file '*.lua' (example : 'python.lua')
##### example : **python.lua**
```lua
local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

ls.add_snippets("python", {
  -- all snippets here
})

```
### 2. register the snippet
add it inside `lua/plugins/luasnip.lua`
