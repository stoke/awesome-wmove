local awful = require('awful')
local client = client
local ipairs = ipairs

module("wmove")

function move(direction, step)
  local focused = client.focus
  local geo = focused:geometry()

  if     direction == "Up"    then geo['y'] = geo['y'] - step
  elseif direction == "Down"  then geo['y'] = geo['y'] + step
  elseif direction == "Left"  then geo['x'] = geo['x'] - step
  elseif direction == "Right" then geo['x'] = geo['x'] + step
  end

  focused:geometry(geo)
end

function table(step)
  local modifiers = { "Mod4", "Control" }
  local directions = { "Up", "Down", "Right", "Left" }
  local keys = {}
  
  for k, v in ipairs(directions) do
    keys = awful.util.table.join(keys,
      awful.key(modifiers, v, function ()
        move(v, step or 3)
      end)
    )
  end

  return keys
end

