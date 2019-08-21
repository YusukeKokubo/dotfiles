
-- original is https://gist.github.com/fukayatsu/3fe0fff3ea86c2443620c0efead90060

local function keyStroke(mod, key)
  return function() hs.eventtap.keyStroke(mod, key) end
end

local function remap(appName, mod1, key1, mod2, key2)
  if (not appName) then
    return hs.hotkey.bind(mod1, key1, keyStroke(mod2, key2))
  end

  local hotkey = hs.hotkey.new(mod1, key1, keyStroke(mod2, key2))
  return hs.window.filter.new(appName)
    :subscribe(hs.window.filter.windowFocused,   function() hotkey:enable()  end)
    :subscribe(hs.window.filter.windowUnfocused, function() hotkey:disable() end)
end

-- global remap
remap(nil, {'ctrl'}, '[', {}, 'escape')

-- remap for Slack.app
-- see also: http://blog.glidenote.com/blog/2014/08/06/custom-keybind-for-slack/
remap('Slack', {'ctrl'}, '\'', {'alt'},          'up')
remap('Slack', {'ctrl'}, ';', {'alt'},          'down')
remap('Slack', {'ctrl'}, 'm', {'alt', 'shift'}, 'down')
remap('Slack', {'ctrl'}, 'o', {'alt', 'shift'}, 'up')


remap('Typetalk', {'ctrl'}, '\'', {'alt'},          'up')
remap('Typetalk', {'ctrl'}, ';', {'alt'},          'down')
remap('Typetalk', {'ctrl'}, 'm', {'alt', 'shift'}, 'down')
remap('Typetalk', {'ctrl'}, 'o', {'alt', 'shift'}, 'up')


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

-- eventtap = hs.eventtap.new({hs.eventtap.event.types.flagsChanged, hs.eventtap.event.types.keyDown, hs.eventtap.event.types.keyUp}, handleEvent)
-- eventtap:start()
