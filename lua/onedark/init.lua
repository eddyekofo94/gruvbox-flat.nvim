local util = require("onedark.util")
local theme = require("onedark.theme")

local M = {}

function M.colorscheme()
  util.load(theme.setup())
end

return M
