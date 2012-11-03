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

function resize(direction, step)
  local focused = client.focus
  local geo = focused:geometry()

  if     direction == "Up"    then geo['height'] = geo['height'] - step
  elseif direction == "Down"  then geo['height'] = geo['height'] + step
  elseif direction == "Left"  then geo['width'] = geo['width'] - step
  elseif direction == "Right" then geo['width'] = geo['width'] + step
  end

  focused:geometry(geo)
end

function table(step)
  local mmodifiers = { "Mod4", "Control" }
  local rmodifiers = { "Mod4", "Mod1" }
  local directions = { "Up", "Down", "Right", "Left" }
  local keys = {}
  
  for k, v in ipairs(directions) do
    keys = awful.util.table.join(keys,
      awful.key(mmodifiers, v, function ()
        move(v, step or 18)
      end),

      awful.key(rmodifiers, v, function ()
        resize(v, step or 18)
      end)
    )
  end
  
  return keys
end

