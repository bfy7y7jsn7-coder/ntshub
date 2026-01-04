-- NTs Hub Loader
local success, status = pcall(function()
    return game:HttpGet("https://raw.githubusercontent.com/bfy7y7jsn7-coder/ntshub/main/status.txt", true)
end)

if not success then
    warn("Could not check status!")
    return
end

if status:lower():find("off") then
    warn("NTs Hub is currently disabled.")
    return
end

local hub_code, err = pcall(function()
    return game:HttpGet("https://raw.githubusercontent.com/bfy7y7jsn7-coder/ntshub/main/main.lua", true)
end)

if not hub_code then
    warn("Failed to load NTs Hub:", err)
    return
end

loadstring(hub_code)()
