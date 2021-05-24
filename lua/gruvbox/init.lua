local util = require("gruvbox.util")
local theme = require("gruvbox.theme")

local M = {}

function M.colorscheme()
  util.load(theme.setup())
end

return M
