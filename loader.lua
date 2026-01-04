-- NTs Hub Loader
local status = game:HttpGet("https://raw.githubusercontent.com/bfy7y7jsn7-coder/ntshub/main/status.txt", true)

if status:lower():find("off") then
    warn("NTs Hub is currently disabled.")
    return
end

loadstring(game:HttpGet("https://raw.githubusercontent.com/bfy7y7jsn7-coder/ntshub/main/main.lua", true))()
