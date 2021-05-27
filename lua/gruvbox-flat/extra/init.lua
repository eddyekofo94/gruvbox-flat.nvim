package.path = "./lua/?/init.lua;./lua/?.lua"

local config = require("gruvbox.config")

local function write(str, fileName)
  print("[write] extra/" .. fileName)
  local file = io.open("extras/" .. fileName, "w")
  file:write(str)
  file:close()
end

local extras = { kitty = "conf", alacritty = "yml" }
for extra, ext in pairs(extras) do
  local plugin = require("gruvbox.extra." .. extra)
  write(plugin[extra](config), extra .. "_gruvbox_" .. "." .. ext)
end
