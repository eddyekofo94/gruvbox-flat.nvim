local util = require("gruvbox-flat.util")
local theme = require("gruvbox-flat.theme")

local M = {}

function M.colorscheme()
  util.load(theme.setup())
end

return M
