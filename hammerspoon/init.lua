-- original is https://github.com/STRML/init/blob/master/hammerspoon/init.lua

local hotkey = require "hs.hotkey"

local slackKeybinds = {
    hotkey.new({"ctrl"}, "m", function()
        hs.eventtap.keyStroke({"alt", "shift"}, "Down")
    end),
    hotkey.new({"ctrl", "shift"}, "m", function()
        hs.eventtap.keyStroke({"alt", "shift"}, "Up")
    end),
    hotkey.new({"ctrl"}, "p", function()
        hs.eventtap.keyStroke({"alt"}, "Up")
    end),
    hotkey.new({"ctrl"}, "n", function()
        hs.eventtap.keyStroke({"alt"}, "Down")
    end),
    -- Disables cmd-w entirely, which is so annoying on slack
    hotkey.new({"cmd"}, "w", function() return end)
}
local slackWatcher = hs.application.watcher.new(function(name, eventType, app)
    if eventType ~= hs.application.watcher.activated then return end
    local fnName = name == "Slack" and "enable" or "disable"
    for i, keybind in ipairs(slackKeybinds) do
        -- Remember that lua is weird, so this is the same as keybind.enable() in JS, `this` is first param
        keybind[fnName](keybind)
    end
end)
slackWatcher:start()


-- original is https://gist.githubusercontent.com/mizoguche/fa1e2ad4f6580533b8c765fd09840d87/raw/e59c85b5547065b7fc1fcbe31fe10b46f957c8a1/init.lua

local prevKeyCode
local escape = 0x35
local leftCommand = 0x37
local rightCommand = 0x36
local eisuu = 0x66
local kana = 0x68

local function keyStroke(modifiers, character)
    hs.eventtap.keyStroke(modifiers, character)
end

local function jp()
    keyStroke({}, kana)
end

local function eng()
    keyStroke({}, eisuu)
end

local function handleEvent(e)
    local keyCode = e:getKeyCode()
    if keyCode == escape then
        eng()
    end


    local isCmdKeyUp = not(e:getFlags()['cmd']) and e:getType() == hs.eventtap.event.types.flagsChanged
    if isCmdKeyUp and prevKeyCode == leftCommand then
        eng()
    elseif isCmdKeyUp and prevKeyCode == rightCommand then
        jp()
    end

    prevKeyCode = keyCode
end

eventtap = hs.eventtap.new({hs.eventtap.event.types.flagsChanged, hs.eventtap.event.types.keyDown, hs.eventtap.event.types.keyUp}, handleEvent)
eventtap:start()