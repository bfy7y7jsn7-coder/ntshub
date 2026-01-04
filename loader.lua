-- NTs Hub Loader
local url_status = "https://raw.githubusercontent.com/bfy7y7jsn7-coder/ntshub/main/status.txt"
local url_hub    = "https://raw.githubusercontent.com/bfy7y7jsn7-coder/ntshub/main/main.lua"

-- Get status safely
local ok, status = pcall(function()
    return game:HttpGet(url_status, true)
end)

if not ok then
    warn("Cannot check NTs Hub status!")
    return
end

-- Strip spaces, newlines, and lowercase
status = status:lower():gsub("%s+", "")

-- Stop execution if off
if status == "off" then
    warn("NTs Hub is currently disabled.")
    return
end

-- Load the hub if on
local ok2, hub = pcall(function()
    return game:HttpGet(url_hub, true)
end)
if not ok2 then
    warn("Failed to load NTs Hub:", hub)
    return
end

loadstring(hub)()

