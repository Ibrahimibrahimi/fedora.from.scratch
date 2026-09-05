-- This file needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :( 

---@type ChadrcConfig
local M = {}

-- NOTE: i modified this myself
M.base46 = {
--	theme = "catppuccin", NOTE: i modified this
  	theme = "catppuccin",

    -- make comments italic
	 hl_override = {
	 	Comment = { italic = true },
	 	["@comment"] = { italic = true },
	 },
}

 -- NOTE: i modified this 
 M.nvdash = { load_on_startup = true }
 M.ui = {
       tabufline = {
          lazyload = false
      }
 }

return M
